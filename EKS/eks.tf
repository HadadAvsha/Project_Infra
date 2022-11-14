resource "aws_eks_cluster" "eks" {
 name = var.cluster_name
 role_arn = aws_iam_role.avsha-eks_cluster.arn
 version = "1.23"

 vpc_config {
    # endpoint_public_access = true
    # endpoint_private_access = false

  subnet_ids = var.public_subnets_ids #module.Network.public_subnets_ids[*]
    # var.private_subnets_ids
    # aws_subnet.public_subnets.id,
    # aws_subnet.private_subnets.id
    
 }

 depends_on = [
  aws_iam_role.avsha-eks_cluster, aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
 ]
}

 resource "aws_eks_node_group" "worker-node-group" {
  cluster_name  = aws_eks_cluster.eks.name
  node_group_name = var.node_group #"${var.prefix}-workernodes"
  node_role_arn  = aws_iam_role.workernodes.arn
  subnet_ids = var.public_subnets_ids
    
    # var.private_subnets_ids
    # aws_subnet.public_subnets.id,
    # aws_subnet.private_subnets.id
    
  instance_types = ["t3.xlarge"]
  ami_type = "AL2_x86_64"
  capacity_type = "ON_DEMAND"
  disk_size = 20


  scaling_config {
   desired_size = 3
   max_size   = 3
   min_size   = 2
  }
 
  depends_on = [
   aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
   aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
   aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
   aws_iam_role_policy_attachment.EC2InstanceProfileForImageBuilderECRContainerBuilds,
  ]
 }

# resource "aws_eks_identity_provider_config" "example" {
#   cluster_name = aws_eks_cluster.eks.name

#   oidc {
#     client_id                     = "your client_id"
#     identity_provider_config_name = "example"
#     issuer_url                    = "your issuer_url"
#   }
# }

# resource "aws_iam_openid_connect_provider" "example" {
#   client_id_list  = ["sts.amazonaws.com"]
#   thumbprint_list = [data.tls_certificate.example.certificates[0].sha1_fingerprint]
#   url             = aws_eks_cluster.example.identity[0].oidc[0].issuer
# }