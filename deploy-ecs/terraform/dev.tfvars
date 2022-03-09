region = "ap-southeast-2"
tag_name = "Learn TF"
env = "dev"

# State management bucket
bucket = "tk-learning-tf-state"
key = "terraform/state"

# VPC
vpc_cidr_block = "12.1.0.0/16"
public_subnet_cidr_blocks = ["12.1.0.0/24", "12.1.1.0/24", "12.1.2.0/24"]
private_subnet_cidr_blocks = ["12.1.10.0/24", "12.1.11.0/24", "12.1.12.0/2"]
