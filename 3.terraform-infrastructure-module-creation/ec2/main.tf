resource "aws_instance" "ec2_instance" {
  ami           = "ami-0dcc1e21636832c5d"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ var.vpc_security_group_ids ]
  tags = {
    Name = var.ec2_instance_name
  }
}