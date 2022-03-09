# Terraform Example to create VPC

## PLAN

### (1) VPC

VPC takes CIDR range of **12.1.0.0/16** (12.1.0.0 to 12.1.255.255, total of 65536 hosts).

- We enable `enable_dns_hostname` as it is false by default. AWS will provide instances in a VPC with public and private DNS hostnames that correspond to the public and private IPv4 as in (`ip-public-ipv4-address.region.compute.internal` and `ip-private-ipv4-address.region.compute.internal`).

### (2) Internet Gateway

Internet Gateway should be attached to VPC. Using terraform function `aws_vpc.main.id` to get the VPC ID.

### (3) Subnet

One public subnet per zone (3 zones) and one private subnet per zone.

**Public**

***AZ1***: 12.1.0.0/24 (12.1.0.0 to 12.1.0.255)
***AZ2***: 12.1.1.0/24 (12.1.1.0 to 12.1.1.255)
***AZ3***: 12.1.2.0/24

**Private**

***AZ1***: 12.1.10.0/24
***AZ2***: 12.1.11.0/24
***AZ3***: 12.1.12.0/24

### (4) Route Tables

We create public and private Route tables and associate them to respective subnets. Public Rote table has Internet Gateway associated.

## REFERENCE

- https://www.mydatahack.com/how-to-create-and-configure-vpc-and-subnets-in-aws/

- https://medium.com/@maneetkum/create-subnet-per-availability-zone-in-aws-through-terraform-ea81d1ec1883

- https://medium.com/warp9/get-started-with-aws-ecs-cluster-using-terraform-cfba531f7748
