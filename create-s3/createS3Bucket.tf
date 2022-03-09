terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.4.0"
    }
  }
  backend "local" {
    path = "./states/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "your-terraform-state-bucket-name"
  tags = {
    Name        = "Playing with Terraform"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_acl" "terraform_state_bucket_acl" {
  bucket = aws_s3_bucket.terraform_state_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_bucket_encryption" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
  }
}

module "website_s3_bucket" {
  source      = "./modules/static-web-bucket"
  bucket_name = "your-bucket-name-for-hosting"
  tags = {
    Name        = "Playing with Terraform"
    Environment = "dev"
  }
}

module "bucket_with_life_cycle" {
  source                       = "./modules/private-encrypted-with-lifecycle-bucket"
  bucket_name                  = "terraform-learn-testing-bucket-with-life-cycle"
  glacier_ir_transition_days   = 90
  deep_archive_transition_days = 180
  expiration_days              = 270
  tags = {
    Name        = "Playing with Terraform"
    Environment = "dev"
  }
}