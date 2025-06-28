module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name                   = "${var.project}-cluster"
  cluster_version                = "1.33"
  cluster_endpoint_public_access = true

  vpc_id                                 = module.vpc.vpc_id
  subnet_ids                             = module.vpc.private_subnets
  cloudwatch_log_group_retention_in_days = 0
  create_cloudwatch_log_group            = false
  cluster_enabled_log_types              = []
  create_cluster_security_group          = false
  create_node_security_group             = false

  eks_managed_node_groups = {
    general = {
      ami_type     = "BOTTLEROCKET_ARM_64"
      desired_size = 2
      max_size     = 5
      min_size     = 1

      instance_types = ["t4g.small"]
      capacity_type  = "ON_DEMAND"

      labels = {
        Environment = var.environment
        Project     = var.project
        type        = "infra"
      }

      tags = {
        ExtraTag = "eks-node-group"
      }
    }
  }

  manage_aws_auth_configmap = true
  aws_auth_roles            = [
    {
      rolearn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.project}-cluster-karpenter-node-role"
      username = "system:node:{{EC2PrivateDNSName}}"
      groups   = [
        "system:bootstrappers",
        "system:nodes",
      ]
    }
  ]

  tags = {
    Environment              = var.environment
    Project                  = var.project
    ManagedBy                = "terraform"
    "karpenter.sh/discovery" = "${var.project}-cluster"
  }
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}
provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_name
}
