# Setup

```sh
terraform -chdir=infra init
terraform -chdir=infra fmt && terraform -chdir=infra validate
terraform -chdir=infra apply -auto-approve
```

```sh
kubectl apply -f infra/karpenter.yaml
# ec2nodeclass.karpenter.k8s.aws/default created
# nodepool.karpenter.sh/default created

# confirm
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
kubectl apply -f manifest/inflate.yaml
# deployment.apps/inflate created

kubectl get node
# NAME                                           STATUS   ROLES    AGE     VERSION
# ip-10-0-0-89.ca-central-1.compute.internal     Ready    <none>   8m47s   v1.35.0-eks-ac2d5a0
# ip-10-0-0-97.ca-central-1.compute.internal     Ready    <none>   8m47s   v1.35.0-eks-ac2d5a0
# ip-10-0-1-105.ca-central-1.compute.internal    Ready    <none>   8m47s   v1.35.0-eks-ac2d5a0
# ip-10-0-10-120.ca-central-1.compute.internal   Ready    <none>   8m47s   v1.35.0-eks-ac2d5a0
# ip-10-0-10-122.ca-central-1.compute.internal   Ready    <none>   8m42s   v1.35.0-eks-ac2d5a0
# ip-10-0-12-36.ca-central-1.compute.internal    Ready    <none>   8m47s   v1.35.0-eks-ac2d5a0
# ip-10-0-2-77.ca-central-1.compute.internal     Ready    <none>   8m46s   v1.35.0-eks-ac2d5a0
# ip-10-0-5-212.ca-central-1.compute.internal    Ready    <none>   8m47s   v1.35.0-eks-ac2d5a0
# ip-10-0-6-100.ca-central-1.compute.internal    Ready    <none>   111m    v1.35.0-eks-ac2d5a0
# ip-10-0-6-188.ca-central-1.compute.internal    Ready    <none>   8m47s   v1.35.0-eks-ac2d5a0
```
