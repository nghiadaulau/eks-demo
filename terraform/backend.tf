terraform {
  backend "s3" {
    bucket       = "kai-eks-demo-terraform-state"
    key          = "prod/act-workload-prod.tfstate"
    region       = "ap-southeast-1"
    use_lockfile = true
  }
  required_version = ">= 1.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.95.0, < 6.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">=3.0.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">=2.37"
    }
  }

}