#--VPC Outputs-------
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private1_subnet" {
  value = module.vpc.private_subnet
}

output "public1_subnet" {
  value = module.vpc.public_subnet
}

#---Security Group-----------



output "db_username" {
  value = values(module.aurora).*.db_username
  sensitive = true
}

output "db_endpoint" {
  value = values(module.aurora).*.db_endpoint
  sensitive = true
}