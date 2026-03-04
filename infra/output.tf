output "eks_kubeconfig_command" {
  value = "\naws eks update-kubeconfig --region ${local.region} --name ${module.eks.cluster_name}\n"
}
