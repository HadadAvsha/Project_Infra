module "EKS" {
    source = "./EKS"
    azs = var.azs
    # public_subnet_cidrs = var.public_subnet_cidrs
    # private_subnet_cidrs = var.private_subnet_cidrs
    prefix = var.prefix
}

# module "Helm-charts" {
#     source = "./Helm-charts"
#     # cluster_name = output.cluster_name

# }