provider "aws" {
  region = "us-east-1"
}


module "test_vpc" {
  source   = "./vpc"
  vpc_name = "main_vpc"
}

module "security_group_test" {
  source = "./security-group"
}

module "ec2_module_instance" {
  source            = "./ec2"
  ec2_instance_name = "main_ec2"
  ec2_subnet_id     = module.test_vpc.public_subnet_id
}