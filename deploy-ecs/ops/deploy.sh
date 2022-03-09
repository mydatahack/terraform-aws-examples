#!/usr/bin/env bash
set -Eeuxo pipefail
trap "echo ERR trap fired!" ERR

#export AWS_REGION="ap-southeast-2"
#export TF_STATE_BUCKET=""
#export SERVICE_NAME=""
#export APPLICATION_IMAGE=""
#export DEPLOY_STAGE=""
#export BUILDKITE_BUILD_NUMBER="4"

AWS_REGION=$1
TF_STATE_BUCKET=$2
SERVICE_NAME=$3
APPLICATION_IMAGE=$4
DEPLOY_STAGE=$5
BUILDKITE_BUILD_NUMBER=$6

export INFRA_CODE_DIR="terraform"
export SERVICE_CONFIG="${DEPLOY_STAGE}.tfvars"

cd ${INFRA_CODE_DIR}

echo "--- Initialising terraform"
terraform init \
  -backend-config="bucket=${TF_STATE_BUCKET}" \
  -backend-config="key=${DEPLOY_STAGE}/${SERVICE_NAME}.tfstate" \
  -backend-config="region=${AWS_REGION}"

echo "--- Validating terraform files"
terraform validate

echo "--- Logging in to ECR"
aws ecr get-login-password --region "${AWS_REGION}" | docker login --username AWS --password-stdin "${APPLICATION_IMAGE}"

echo "--- Executing Terraform plan"
terraform plan \
  -var="service_name=${SERVICE_NAME}" \
  -var="application_image=${APPLICATION_IMAGE}" \
  -var="application_build=${BUILDKITE_BUILD_NUMBER}" \
  -var-file="${SERVICE_CONFIG}"

echo "--- Deploying ${SERVICE_NAME} to ${DEPLOY_STAGE}"
terraform apply -auto-approve \
  -var="service_name=${SERVICE_NAME}" \
  -var="application_image=${APPLICATION_IMAGE}" \
  -var="application_build=${BUILDKITE_BUILD_NUMBER}" \
  -var-file="${SERVICE_CONFIG}"
