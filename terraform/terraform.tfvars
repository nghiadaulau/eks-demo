# Environment and Project
environment = "demo"
project     = "eks-demo"

# VPC Configuration
vpc = {
  cidr                   = "10.0.0.0/16"
  availability_zones     = ["ap-southeast-1a", "ap-southeast-1b"]
  private_subnets        = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets         = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
} 