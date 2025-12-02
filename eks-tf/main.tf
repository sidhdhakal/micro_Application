module "vpc" {
  source = "./modules/vpc"

  name               = var.name
  cidr               = var.cidr
  azs                = var.azs
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway
  env                = var.env
  tags               = var.tags
}


###########
# IAM MODULE
###########
module "iam" {
  source = "./modules/iam"

  name           = var.name
}



module "eks" {
  source = "./modules/eks"

  cluster_name      = var.cluster_name
  cluster_role_arn  = module.iam.cluster_role_arn
  node_role_arn     = module.iam.node_role_arn

  subnet_ids        = module.vpc.private_subnets
  vpc_id            = module.vpc.vpc_id

  desired_size  = var.desired_size
  min_size      = var.min_size
  max_size      = var.max_size
  instance_type = var.instance_type
}

