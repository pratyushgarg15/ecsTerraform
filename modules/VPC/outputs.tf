output "VPC_id" {
  value = aws_vpc.pratyush-vpc.id
}

output "public_subnet_ids" {
  value = module.subnets.public_subnet_ids
}