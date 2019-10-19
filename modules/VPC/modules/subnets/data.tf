# data "aws_subnet_ids" "public" {
#    vpc_id = var.vpc-id

#   filter {
#     name   = "tag:Name"
#     values = ["pratyushPB"]       
#   }
# }

# # data "aws_subnet" "public" {
# #   count = "2"
# #   id    = data.aws_subnet_ids.public.ids[count.index]
# # }

# data "aws_subnet_ids" "private" {
#    vpc_id = var.vpc-id

#   filter {
#     name   = "tag:Name"
#     values = ["pratyushPR"]       
#   }
# }

# # data "aws_subnet" "private" {
# #   count = "2"
# #   id    = data.aws_subnet_ids.private.ids[count.index]
# # }

# # data "aws_subnet_ids" "subnets" {
# #    vpc_id = var.vpc-id
# # }