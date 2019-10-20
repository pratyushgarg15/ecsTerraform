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





