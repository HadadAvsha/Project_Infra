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

# variable "public_subnets_id" {}
# variable "private_subnets_id" {}
variable "cluster_name" {
    default = "Avsha-EKS-cluster"
}
# variable "cluster_cert" {}
variable "node_group" {
 default = "Avsha-EKS-workernodes"
}
# variable "cluster_cert" {}
# variable "host" {}
# variable "private_subnet_cidrs" {}
variable "public_subnet_cidrs" {}