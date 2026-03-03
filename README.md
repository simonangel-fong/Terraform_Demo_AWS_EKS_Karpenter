# Terraform_Demo_AWS_EKS_Karpenter
A repo to learn EKS Karpenter

- ref: https://karpenter.sh/docs/


```sh
helm upgrade --install karpenter oci://public.ecr.aws/karpenter/karpenter \
  --version "v1.9" \
  --namespace "karpenter" --create-namespace \
  --set "settings.clusterName=eks-karpenter-demo" \
  --set "settings.interruptionQueue=eks-karpenter-demo" \
  --set controller.resources.requests.cpu=1 \
  --set controller.resources.requests.memory=1Gi \
  --set controller.resources.limits.cpu=1 \
  --set controller.resources.limits.memory=1Gi \
  --wait


aws ecr get-login-password --region ca-central-1 | docker login --username AWS --password-stdin 099139718958.dkr.ecr.ca-central-1.amazonaws.com


```

kubectl drain ip-10-0-18-119.ca-central-1.compute.internal --ignore-daemonsets --delete-emptydir-data
kubectl drain ip-10-0-6-37.ca-central-1.compute.internal --ignore-daemonsets --delete-emptydir-data
kubectl delete node ip-10-0-18-119.ca-central-1.compute.internal
kubectl delete node ip-10-0-6-37.ca-central-1.compute.internal