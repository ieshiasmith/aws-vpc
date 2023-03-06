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
