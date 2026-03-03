```sh
terraform -chdir=infra/eks_karpenter init
terraform -chdir=infra/eks_karpenter fmt && terraform -chdir=infra/eks_karpenter validate
terraform -chdir=infra/eks_karpenter apply -auto-approve
```

```sh
kubectl apply -f infra/eks_karpenter/karpenter.yaml
# ec2nodeclass.karpenter.k8s.aws/default created
# nodepool.karpenter.sh/default created

kubectl get ec2nodeclass.karpenter.k8s.aws/default
# NAME      READY   AGE
# default   True    40s

kubectl get nodepool.karpenter.sh/default
# NAME      NODECLASS   NODES   READY   AGE
# default   default     0       True    72s

kubectl rollout restart deploy/karpenter -n kube-system
# deployment.apps/karpenter restarted
```

# testing

```sh
kubectl apply -f infra/eks_karpenter/inflate.yaml
# deployment.apps/inflate created

kubectl get node
```
