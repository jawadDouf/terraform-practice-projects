provider "aws" {
  region = "us-east-1"
}


module "test_vpc" {
  source = "./vpc"
  
}

module "security_group_test" {
  source = "./security-group"  
}

module "ec2_instance" {
  source = "./ec2"
  vpc_security_group_ids = module.security_group_test.security_group_id
}