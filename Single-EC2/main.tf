terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-2"
}

resource "aws_instance" "app_server" {
  ami = "ami-0186908e2fdeea8f3"
  instance_type = "t1.micro"

  tags = {
    Name = var.instance_name
  }
}
