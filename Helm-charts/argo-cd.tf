provider "helm" {
  kubernetes {
    host                   = var.endpoint #module.EKS.cluster_name
    cluster_ca_certificate = base64decode(var.cluster_cert)#(module.EKS.cluster_cert)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]#["eks", "get-token", "--cluster-name", module.EKS.cluster_name]
      command     = "aws"
    }
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
  namespace  = "default"
  version    = "5.8.3"
  cleanup_on_fail = true
  
  values = [
    file("${path.module}/argo-cd-values.yaml")
  ]

  provisioner "local-exec" {
    command = "bash ~/my_scripts/argo-repo_main-app.sh"
  }
}


# provider "kubernetes" {
#   host                   = var.endpoint
#   cluster_ca_certificate = base64decode(var.cluster_cert)
#     exec {
#       api_version = "client.authentication.k8s.io/v1beta1"
#       args        = ["eks", "get-token", "--cluster-name", var.cluster_name]#["eks", "get-token", "--cluster-name", module.EKS.cluster_name]
#       command     = "aws"
#     }
# }

# # resource "kubernetes_namespace" "argocd" {
# #   metadata {
# #     name = "argo-cd"
# #   }
# # }


# provider "helm" {
#   kubernetes {
#     host                   = var.endpoint
#     cluster_ca_certificate = base64decode(var.cluster_cert)
#       exec {
#         api_version = "client.authentication.k8s.io/v1beta1"
#         args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
#         command     = "aws"
#       }
#   }
# }

# resource "helm_release" "argocd" {
#   # depends_on = [kubernetes_namespace.argocd]
#   name       = "argo-cd"
#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argo-cd"
#   namespace  = "argo-cd"
#   version    = "5.8.3"
#   create_namespace = true
#   values = [
#     file("${path.module}/argo-cd-values.yaml")
#   ]
# }