output "vpc_id" {
  value = aws_vpc.vpc.id
  sensitive = false
}

output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

# output "host" {
#   value = 
# }