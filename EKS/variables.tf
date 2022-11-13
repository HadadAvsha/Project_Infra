variable "prefix" {}
variable "public_subnets_ids" {
  type        = list(string)
}
# variable "private_subnets_ids" {}
variable "cluster_name" {}
# variable "cluster_cert" {}
variable "node_group" {}
# variable "host" {}