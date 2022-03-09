terraform {
  required_providers {
    aws = "~> 3.0"
  }
  backend "local" {
    path = "./states/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_codestarconnections_connection" "my_github" {
  name = "my-github-connection"
  provider_type = "GitHub"

  tags = {
    Name        = "terraform demo"
    Environment = "dev"
  }
}

resource "aws_codestarconnections_connection" "mdh_bitbucket" {
  name = "my-bitbucket-connection"
  provider_type = "BitBucket"

  tags = {
    Name        = "terraform demo"
    Environment = "dev"
  }
}