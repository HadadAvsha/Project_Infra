resource "helm_release" "aws-ebs-csi-driver" {
  name         = "aws-ebs-csi-driver"
  repository   = "https://kubernetes-sigs.github.io/aws-ebs-csi-driver"
  chart        = "aws-ebs-csi-driver"
  namespace    = "kube-system"
  # force_update = true
  depends_on   = [module.eks.group_node]
}
