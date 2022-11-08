# variable "azs" {
#   type        = list(string)
#   description = "Availability Zones"
# }
# variable "public_subnet_cidrs" {
#   type        = list(string)
#   description = "Public Subnet CIDR values"
# }
# variable "private_subnet_cidrs" {
#   type        = list(string)
#   description = "Private Subnet CIDR values"
# }
# variable "prefix" {}
variable "azs" {
  type        = list(string)
  description = "Availability Zones"
}
# variable "public_subnet_cidrs" {
#   type        = string
#   description = "Public Subnet CIDR values"
# }
# variable "private_subnet_cidrs" {
#   type        = string
#   description = "Private Subnet CIDR values"
# }
variable "prefix" {}