provider "helm" {
  kubernetes {
    host                   = module.EKS.host #var.host
    cluster_ca_certificate = base64decode(module.EKS.cluster_cert)#var.cluster_cert
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", module.EKS.cluster_name]#["eks", "get-token", "--cluster-name", var.cluster_name]
      command     = "aws"
    }
      # depends_on   = [var.EKS.cluster_name]
  }
}

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
  # namespace  = "argo-cd"
  version    = "5.8.3"

  values = [
    # "${file("argo-cdValues.yml")}"
    file("${path.module}/argo-cd-values.yaml")
  ]
}
