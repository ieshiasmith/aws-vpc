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

output "vpc_cidr" {
  value = module.vpc.vpc_cidr_block
}

output "region" {
  value = var.region
}

output "management_key" {
  value = aws_key_pair.management_key.key_name
}

output "ssh_sg" {
  value = aws_security_group.ssh.id
}

