terraform {
  required_providers {
    aws = "~> 4.0"
  }
}

provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    # Variable not allowed here
    bucket = "mdh-terraform-state"
    key    = "mdh-blog-codepipeline"
    region = "ap-southeast-2"
  }
}
