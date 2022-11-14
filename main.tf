module "EKS" {
    source = "./EKS"
    prefix = var.prefix
    # azs = var.azs
    public_subnets_ids = module.Network.public_subnets_ids[*] #var.public_subnets.id
    # private_subnets_ids = [module.Network.private_subnets_ids]
    cluster_name = var.cluster_name
    node_group = var.node_group
}

module "Network" {
  source              = "./Network"
  prefix              = var.prefix
  azs                 = var.azs
  public_subnet_cidrs = var.public_subnet_cidrs
#   private_subnet_cidrs = [var.private_subnet_cidrs]
#   public_subnets_id = aws_subnet.public_subnets[*].id #var.public_subnets.id
#   private_subnets_id = aws_subnet.private_subnets[*].id
}

module "Helm-charts" {
  source = "./Helm-charts"
  # host = module.EKS.cluster_details.host
  endpoint  = module.EKS.cluster_details.endpoint
  cluster_name = module.EKS.cluster_details.name
  cluster_cert = module.EKS.cluster_details.certificate_authority[0].data
  node_group = module.EKS.node_group
}