provider "kubectl" {
  host                   = aws_eks_cluster.demo.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.demo.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.demo.id]
    command     = "aws"
  }
}

resource "kubectl_manifest" "ebs_csi_controller_sa" {
  yaml_body = <<YAML
apiVersion: v1
kind: ServiceAccount
metadata:
  name: ebs-csi-controller-sa
  namespace: kube-system
  annotations:
    eks.amazonaws.com/role-arn: ${aws_iam_role.eks_ebs_csi_driver.arn}
YAML
}
