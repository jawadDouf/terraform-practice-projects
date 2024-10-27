resource "aws_instance" "ec2_instance" {
  ami           = "ami-0dcc1e21636832c5d"
  instance_type = "t3.micro"
  subnet_id = var.ec2_subnet_id
  tags = {
    Name = var.ec2_instance_name
  }
}