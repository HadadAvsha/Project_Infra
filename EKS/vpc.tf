resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.prefix}-vpc"
  }
  # sharing instances on host
  instance_tenancy = "default"

  #required for EKS
  enable_dns_hostnames = true
  enable_dns_support = true
  enable_classiclink = false
  assign_generated_ipv6_cidr_block = false
  enable_classiclink_dns_support = false
  # enable_classicenable_classiclink_dns_support = false
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

}

resource "aws_eip" "eip" {
  depends_on = [
    aws_internet_gateway.igw
  ]
}
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
#   connectivity_type = "private"
  subnet_id         = aws_subnet.public_subnets.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
  sensitive = false
}