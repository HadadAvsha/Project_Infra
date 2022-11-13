resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.prefix}-vpc"
  }
  # sharing instances on host
  # instance_tenancy = "default"

  #required for EKS
  # enable_dns_hostnames = true
  # enable_dns_support = true
  # enable_classiclink = false
  assign_generated_ipv6_cidr_block = false
  # enable_classiclink_dns_support = false
  ## enable_classicenable_classiclink_dns_support = false
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.ngw.id
#   }
# }

resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidrs) == 1 ? 1 : length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.prefix}-SN-${count.index+1}"
  }
}

resource "aws_route_table_association" "public_subnet_asso" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.prefix}-igw"
  }
}

# resource "aws_subnet" "private_subnets" {
#   # name              = "${var.prefix}-Private_SN"
#   count             = length(var.private_subnet_cidrs) == 1 ? 1 : length(var.private_subnet_cidrs)
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = element(var.private_subnet_cidrs, count.index) #"10.0.2.0/24"#var.private_subnet_cidrs
#   availability_zone = element(var.azs, count.index)
#   # map_public_ip_on_launch = true
#   tags = {
#     Name = "${var.prefix}-Private_SN"
#   }
# }

# resource "aws_route_table_association" "private_subnets_asso" {
#   count          = length(var.private_subnet_cidrs)
#   subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
#   route_table_id = aws_route_table.private_rt.id
# }


# resource "aws_eip" "eip" {
#   depends_on = [
#     aws_internet_gateway.igw
#   ]
# }
# resource "aws_nat_gateway" "ngw" {
#   allocation_id = aws_eip.eip.id
# #   connectivity_type = "private"
#   subnet_id         = aws_subnet.public_subnets.id[0]
# }
