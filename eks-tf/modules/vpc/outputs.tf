output "vpc_id" {
  value = module.aws_vpc.vpc_id
}

output "public_subnets" {
  value = module.aws_vpc.public_subnets
}

output "private_subnets" {
  value = module.aws_vpc.private_subnets
}

output "private_route_table_ids" {
  value = module.aws_vpc.private_route_table_ids
}

output "public_route_table_ids" {
  value = module.aws_vpc.public_route_table_ids
}
