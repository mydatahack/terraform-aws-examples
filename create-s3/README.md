# Creating S3 Bucket by Terraform

This is for creating S3 bucket with Terraform.

## (1) Get Started

In fact, the entry file doesn't need to be named as `main.tf`. I think terraform automatically detect which file is the entry file.

To create, run this:

```bash
export AWS_PROFILE=<your profile name if not using default>

terraform init

terraform plan

terraform apply
```

## 2. Using a local module

Creating static web bucket by using local module (followed this tutorial: https://learn.hashicorp.com/tutorials/terraform/module-create?in=terraform/modules).

## 3. Managing terraform state locally

We can configure where to keep the state file as below.

```hcl
terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}
```
