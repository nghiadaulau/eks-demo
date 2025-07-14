# Karpenter Manifests

Karpenter configuration files for EKS cluster with multi-architecture support.

## Files Description

| File | Purpose | Architecture |
|------|---------|--------------|
| `ec2-node-class.yaml` | EC2 Node Class configuration | Both AMD64 & ARM64 |
| `amd64-node-pool.yaml` | Node Pool for x86_64 instances | AMD64 only |
| `graviton-node-pool.yaml` | Node Pool for ARM64 instances | ARM64 only |

## Quick Deploy

```bash
# Deploy EC2 Node Class first
kubectl apply -f ec2-node-class.yaml

# Deploy Node Pools
kubectl apply -f amd64-node-pool.yaml
kubectl apply -f graviton-node-pool.yaml
```

## Check Status

```bash
kubectl get nodepools
kubectl get ec2nodeclasses
```

## Architecture Support

- **AMD64 Node Pool**: Uses t3.nano, t3.micro, t3.small instances
- **ARM64 Node Pool**: Uses t4g.nano, t4g.micro, t4g.small instances
- **Spot Instances**: Both pools use spot instances for cost optimization 