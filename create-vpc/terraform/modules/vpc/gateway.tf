resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.tag_name}_igw"
    Environment = var.evn
  }
}
