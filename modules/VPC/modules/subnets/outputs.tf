# output "public_subnet_ids" {
#   value = [data.aws_subnet_ids.public.ids]
# }

# output "private_subnet_ids" {
#   value = [data.aws_subnet_ids.private.ids]
# }

output "public_subnet_ids" {
  value = aws_subnet.public-subnet.*.id
}
