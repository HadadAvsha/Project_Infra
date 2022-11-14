provider "helm" {
  kubernetes {
    host                   = var.endpoint #module.EKS.cluster_name
    cluster_ca_certificate = base64decode(var.cluster_cert)#(module.EKS.cluster_cert)
    # token                  = data.aws_eks_cluster_auth.eks_cluster_auth.token
    # load_config_file       = false
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]#["eks", "get-token", "--cluster-name", module.EKS.cluster_name]
      command     = "aws"
    }
      # depends_on   = [var.cluster_name]
  }
}

# provider "kubernetes" {
#   config_context = "minikube"
# }
# resource "kubernetes_namespace" "example" {
#   metadata {
#     name = "my-first-namespace"
#   }
# }

# resource "kubernetes_namespace" "argocd" {
#   metadata {
#     name = "argo-cd"
#   }
# }

resource "helm_release" "argocd" {
  # depends_on = [kubernetes_namespace.argocd]
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "default"
  version    = "5.8.3"

  values = [
    # "${file("argo-cdValues.yml")}"
    file("${path.module}/argo-cd-values.yaml")
  ]
}
