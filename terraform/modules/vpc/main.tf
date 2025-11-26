module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name = var.vpc_name
  cidr = var.cidr_block

  azs = var.azs

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Environment = var.environment
    Project     = var.project
  }
}
