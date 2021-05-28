#!/usr/bin/env bash
set -Eeuxo pipefail
trap "echo ERR trap fired!" ERR

echo "--- Building Docker image in $(pwd)"
docker build --tag "${APPLICATION_IMAGE}" .

echo "--- Pushing app image to Development ECR"
aws ecr get-login-password --region "$AWS_REGION" | docker login --username AWS --password-stdin "${APPLICATION_IMAGE}"
docker push "${APPLICATION_IMAGE}"
