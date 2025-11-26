module "vpc" {
  source = "./modules/vpc"

  name            = "eks-vpc"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-2a", "us-east-2b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}
 
module "iam" {
  source = "./modules/iam"
  cluster_name = var.cluster_name
}

module "eks" {
  source = "./modules/eks"

  cluster_name      = var.cluster_name
  k8s_version       = var.k8s_version
  private_subnets   = module.vpc.private_subnets

  cluster_role_arn  = module.iam.cluster_role_arn
  node_role_arn     = module.iam.node_role_arn

  node_desired = 2
  node_min     = 2
  node_max     = 2

  node_instance_types = ["t2.micro"]

  tags = {
    Environment = terraform.workspace
  }
}
