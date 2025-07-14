# Karpenter Controller - Helm Chart

Deploy Karpenter controller to EKS cluster using Helm.

## 🚀 Quick Deploy

### 1. Build Dependencies

```bash
# Navigate to chart directory
cd chart/karpenter/karpenter-controller

# Build Helm dependencies
helm dependency build
```

### 2. Configure values.yaml

Update the following values in `values.yaml`:

```yaml
karpenter:
  serviceAccount:
    annotations:
      eks.amazonaws.com/role-arn: <KARPENTER_CONTROLLER_ROLE_ARN>
  
  settings:
    clusterName: <CLUSTER_NAME>
    clusterEndpoint: <CLUSTER_ENDPOINT>
```

### 3. Deploy Karpenter Controller

```bash
# Install Karpenter controller
helm install karpenter . --namespace karpenter --create-namespace -f values.yaml
```

## 🔄 Update Configuration

```bash
# Update values.yaml with new configuration
# Then upgrade Karpenter
helm upgrade karpenter . --namespace karpenter -f values.yaml
```

## 🧹 Uninstall

```bash
# Uninstall Karpenter
helm uninstall karpenter -n karpenter

# Delete namespace
kubectl delete namespace karpenter
```

## ⚠️ Important Notes

- **Role ARN**: Must match the IAM role created by Terraform
- **Cluster Endpoint**: Must be accessible from your network
- **Cluster Name**: Must match the EKS cluster name
- **Namespace**: Karpenter will be installed in `karpenter` namespace
- **Configuration**: All settings are managed in `values.yaml` file