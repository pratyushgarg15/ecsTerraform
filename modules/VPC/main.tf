resource "aws_vpc" "pratyush-vpc" {
    cidr_block           = var.vpc_cidr
    enable_dns_hostnames = true
    tags = {
        Name = "pratyush-vpc"
    }
}

module "subnets" {
    source = "./modules/subnets/"
    
    vpc-id          = aws_vpc.pratyush-vpc.id
    azs             = var.azs
    public_subnets  = var.public_subnets
    private_subnets = var.private_subnets

}





# resource "aws_route_table" "public-route-table" {
#     vpc_id = aws_vpc.pratyush-vpc.id
#     tags = {
#         Name = "pratyushPBRT"
#     }
# }                                                                                                                          

# resource "aws_route_table" "private-route-table" {
#     vpc_id = aws_vpc.pratyush-vpc.id
#     tags = {
#         Name = "pratyushPRRT"
#     }
# }

# resource "aws_route_table_association" "public-route-1-association" {
#     route_table_id = aws_route_table.public-route-table.id
#     subnet_id      = aws_subnet.public-subnet-1.id
# }

# resource "aws_route_table_association" "public-route-2-association" {
#     route_table_id = aws_route_table.public-route-table.id
#     subnet_id      = aws_subnet.public-subnet-2.id

# }

# resource "aws_route_table_association" "private-route-1-association" {
#     route_table_id = aws_route_table.private-route-table.id
#     subnet_id      = aws_subnet.private-subnet-1.id
# }

# resource "aws_route_table_association" "private-route-2-association" {
#     route_table_id = aws_route_table.private-route-table.id
#     subnet_id      = aws_subnet.private-subnet-2.id
# }

# resource "aws_eip" "elastic-ip-for-nat-gw" {
#     vpc = true
#     tags = {
#         Name = "pratyushEIP"
#     }
# }

# resource "aws_nat_gateway" "nat-gw" {
#     allocation_id = aws_eip.elastic-ip-for-nat-gw.id
#     subnet_id     = aws_subnet.public-subnet-1.id
#     tags = {
#         Name = "pratyush-NAT-GW"
#     }
#     depends_on = ["aws_eip.elastic-ip-for-nat-gw"]
# }

# resource "aws_route" "nat-gw-route" {
#     route_table_id         = aws_route_table.private-route-table.id
#     nat_gateway_id         = aws_nat_gateway.nat-gw.id
#     destination_cidr_block = "0.0.0.0/0"
# }

# resource "aws_internet_gateway" "pratyush-igw" {
#     vpc_id = aws_vpc.pratyush-vpc.id
#     tags = {
#         Name = "pratyush-IGW"
#     }
# } {
#         Name

# resource "aws_route" "public-internet-igw-route" {
#     route_table_id         = aws_route_table.public-route-table.id
#     gateway_id             = aws_internet_gateway.pratyush-igw.id
#     destination_cidr_block = "0.0.0.0/0"
# }