terraform {
  required_providers {
    aws = "~> 3.0"
  }
}

provider "aws" {
  region  = var.region
}

resource "aws_s3_bucket" "b" {
  bucket = var.tf_bucket_name
  acl    = "private"

  tags = {
    Name        = var.tag_name
    Environment = var.env
  }
}
