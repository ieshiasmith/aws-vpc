output "aws_vpn_gateway_id" {
  description = "The ID of the VPN Gateway"
  value       = module.vpc.vgw_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "default_route_table_id" {
  value = module.vpc.vpc_main_route_table_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "cluster1_name" {
  value = local.cluster1_name
}

output "cluster2_name" {
  value = local.cluster2_name
}

output "cluster3_name" {
  value = local.cluster3_name
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr_block
}

output "region" {
  value = var.region
}

# output "private_subnet_1" {
#   value = module.vpc.aws_subnet.private[0]
# }

# output "private_subnet_2" {
#   value = module.vpc.aws_subnet.private[1]
# }

# output "private_subnet_3" {
#   value = module.vpc.aws_subnet.private[3]
# }
