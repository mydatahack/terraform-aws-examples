# Creating S3 Bucket by Terraform

This is for creating S3 bucket with Terraform.

## (1) Get Started

```bash
# Initialise Terraform
terraform init

# Create a plan
export DEPLOY_STAGE="dev"
terraform plan -var-file="${DEPLOY_STAGE}.tfvars"

# deploy
terraform apply -var-file="${DEPLOY_STAGE}.tfvars" -out
```
