resource "aws_subnet" "public_subnets" {
  # name              = "${var.prefix}-Public_SN"
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"#var.public_subnet_cidrs
  availability_zone = var.azs[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.prefix}-Public_SN"
  }
}

resource "aws_subnet" "private_subnets" {
  # name              = "${var.prefix}-Private_SN"
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"#var.private_subnet_cidrs
  availability_zone = var.azs[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.prefix}-Private_SN"
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
  subnet_id      = aws_subnet.public_subnets.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_subnet_asso" {
  subnet_id      = aws_subnet.private_subnets.id
  route_table_id = aws_route_table.private_rt.id
}