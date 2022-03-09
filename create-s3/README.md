# Creating S3 Bucket by Terraform

This is for creating S3 bucket with Terraform.

## (1) Get Started

```bash
# Optional in case you need to use a particular profile for terraform commands
export AWS_PROFILE=admin

# Initialise Terraform
terraform init

# Create a plan
export DEPLOY_STAGE="dev"
terraform plan -var-file="${DEPLOY_STAGE}.tfvars"

# deploy
terraform apply -var-file="${DEPLOY_STAGE}.tfvars" -out
```

## Reference

We can configure where to keep the state file as below.

```hcl
terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}
```
