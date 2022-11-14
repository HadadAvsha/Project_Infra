# output "vpc_id" {
#   value = aws_vpc.vpc.id
#   sensitive = false
# }
# output "cluster_name" {
#   value = aws_eks_cluster.eks.name
# }
# output "host" {
#   value = aws_eks_cluster.eks.endpoint
# }
output "node_group" {
  value = aws_eks_node_group.worker-node-group
}
# output "cluster_cert" {
#   value = aws_eks_cluster.eks.certificate_authority.0.data
# }
output "cluster_details" {
  value = aws_eks_cluster.eks
}
# output "auth" {
#   value = aws_eks_cluster_auth.eks_cluster_auth.token
# }
