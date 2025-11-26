module "fargate_profile" {
  source  = "terraform-aws-modules/eks/aws//modules/fargate-profile"
  version = "20.8.4"

  cluster_name = var.cluster_name
  fargate_profile_name = var.fargate_profile_name

  selectors = [
    {
      namespace = var.namespace
    }
  ]

  tags = {
    Environment = var.environment
    Project     = var.project
  }
}
