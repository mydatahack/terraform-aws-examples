# AWS Configurations
variable "region" { type = string }
variable "tag_name" { type = string }
variable "env" { type = string }

# State Management Bucket
variable "bucket" { type = string }
variable "key" { type = string }

# VPC
variable "vpc_cidr_block" { type = string }
variable "public_subnet_cidr_blocks" { type = string }
variable "private_subnet_cidr_blocks" { type = string }
