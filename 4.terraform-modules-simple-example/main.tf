provider "aws" {
  region = var.region
}

module "vpc" {
  source   = "./child-modules/vpc"
  region   = var.region
  vpc_name = "main_vpc"
}

resource "aws_instance" "my-instance" {
  ami           = module.vpc.ami_id    # get the output with the name "ami_id" from the vpc module 
  subnet_id     = module.vpc.subnet_id # get the output with the name "subnet_id" from the vpc module 
  instance_type = "t3.micro"
}