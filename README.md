# terraform-aws-examples

Terraform Examples for AWS.

## Terraform Commands

```bash
# Initialise
terraform init

# Lint tf files
terraform fmt

# Create a plan with a tfvar file
terraform plan -var-file="dev.tfvars"

# Apply with a tfvar file
terraform apply -var-file="dev.tfvars"
```

## REFERENCES

- Terraform use AWS SDK written in Go

### (1) State Management

We can manage Terraform state with different way (e.g. using S3 or DynamoDB).

Managing Terraform state with S3 bucket (https://blog.gruntwork.io/how-to-manage-terraform-state-28f5697e68fa).

#### Using S3

1. Use [Deploy-S3]('./Deploy-S3) to create bucket. This doesn't have backend configured, which means state will be stored locally. This is fine for creating a bucket for Terraform state management.

2. There are two options for pointing the state to backend: do it in the backend config in the tf file or do it as a command line argument.

```t
terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-state"
    key            = "tfstate/terraform.tfstate"
    region         = var.aws_region
  }
}
```

Alternatively, initialise terraform with backend config

```bash
terraform init \
  -backend-config="bucket=${TF_STATE_BUCKET}" \
  -backend-config="key=${DEPLOY_STAGE}/${SERVICE_NAME}.tfstate" \
  -backend-config="region=${AWS_REGION}"
```

## (2) Using a Local Module

From this tutorial (https://learn.hashicorp.com/tutorials/terraform/module-create?in=terraform/modules).
