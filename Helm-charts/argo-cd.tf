provider "helm" {
  kubernetes {
    host                   = module.EKS.host
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
      # args        = ["eks", "get-token", "--cluster-name", ["${module.EKS.aws_eks_cluster.eks.name}"]]
      command     = "aws"
    }
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argo-cd"
  }
}

resource "helm_release" "argocd" {
  depends_on = [kubernetes_namespace.argocd]
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argo-cd"
  version    = "5.8.3"

  values = [
    # "${file("argo-cdValues.yml")}"
    # file("${path.module}argo-cd-values.yaml")
    file("argo-cd-values.yaml")
  ]
}

