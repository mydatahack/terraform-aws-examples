terraform {
  required_providers {
    aws = "~> 3.0"
  }
}

provider "aws" {
  region  = var.region
}

terraform {
  backend "s3" {
  }
}
