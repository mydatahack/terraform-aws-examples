terraform {
  required_providers {
    aws = "~> 3.0"
  }
}

provider "aws" {
  region  = var.region
  profile = var.common_name
}

terraform {
  backend "s3" {
    bucket = var.bucket
    key = var.key
  }
}
