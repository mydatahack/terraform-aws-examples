data "aws_availability_zones" "available" {}

#Public Subnet in Each Zone
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  count                   = length(data.aws_availability_zones.available.names)
  cidr_block              = "12.1.${count.index}.0/24"
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.tag_name}_public_subnet_${element(var.zones, count.index)}"
    Environment = var.env
  }
}

#Private Subnet in Each Zone
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  count                   = length(data.aws_availability_zones.available.names)
  cidr_block              = "12.1.1${count.index}.0/24"
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name = "${var.tag_name}_private_subnet_${element(var.zones, count.index)}"
    Environment = var.env
  }
}
