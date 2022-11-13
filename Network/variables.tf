variable "prefix" {}
variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}
# variable "private_subnet_cidrs" {
#   type        = list(string)
#   description = "Private Subnet CIDR values"
# }
#variable "aws_instance" {
#  description = "aws_instance.vm"
#}

# variable "public_subnets_id" {
#   type        = list(string)
# }
# variable "private_subnets_id" {
#   type        = list(string)
# }
    # aws_subnet.public_subnets.id,
    # aws_subnet.private_subnets.id