resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostname = true

  tags = {
    Name        = var.tag_name
    Environment = var.env
  }
}
