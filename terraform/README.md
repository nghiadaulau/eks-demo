# EKS Cluster with Karpenter - Terraform

Terraform configuration to deploy an EKS cluster with Karpenter for auto-scaling.

## 🏗️ Infrastructure Components

- **VPC**: Custom VPC with public/private subnets
- **EKS Cluster**: Kubernetes cluster with managed node groups
- **Karpenter**: Auto-scaling solution for EKS
- **Security Groups**: Network security configuration
- **IAM Roles**: Service accounts and node roles

## 📁 Files Structure

| File                           | Purpose                              |
|--------------------------------|--------------------------------------|
| `main.tf`                      | Main Terraform configuration         |
| `provider.tf`                  | AWS provider configuration           |
| `backend.tf`                   | S3 backend for state storage         |
| `variables.tf`                 | Input variables definition           |
| `terraform.tfvars`             | Variable values                      |
| `vpc.tf`                       | VPC and subnet configuration         |
| `eks.tf`                       | EKS cluster configuration            |
| `addons.tf`                    | EKS add-ons (VPC CNI, CoreDNS, etc.) |
| `security_group.tf`            | Security groups for EKS              |
| `karpenter_controller_role.tf` | Karpenter controller IAM role        |
| `karpenter_node_role.tf`       | Karpenter node IAM role              |
| `outputs.tf`                   | Output values                        |

## 🚀 Quick Start

### Prerequisites

- AWS CLI configured
- Terraform installed
- kubectl installed

### Deploy Infrastructure

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply
```

### Configure kubectl

```bash
# Get cluster credentials
aws eks update-kubeconfig --region <region> --name <cluster-name>

# Verify connection
kubectl get nodes
```

## 🔧 Configuration

### Variables

Edit `terraform.tfvars` to customize:

```hcl
region       = "ap-southeast-1"
cluster_name = "eks-demo"
vpc_cidr     = "10.0.0.0/16"
```

### Backend Configuration

Update `backend.tf` with your S3 bucket:

```hcl
bucket = "your-terraform-state-bucket"
key    = "eks-demo/terraform.tfstate"
region = "us-west-2"
```

## 🧹 Cleanup

```bash
# Destroy infrastructure
terraform destroy
```

## 📋 Outputs

After deployment, you'll get:

- **Cluster Endpoint**: EKS cluster API endpoint
- **Cluster Name**: Name of the created cluster
- **VPC ID**: ID of the created VPC
- **Subnet IDs**: IDs of public and private subnets
- **IAM Role ARNs**: ARNs for Karpenter roles

## 🔍 Troubleshooting

### Common Issues

1. **Backend not found**: Ensure S3 bucket exists
2. **IAM permissions**: Verify AWS credentials have required permissions
3. **VPC CIDR conflicts**: Check for overlapping CIDR ranges
