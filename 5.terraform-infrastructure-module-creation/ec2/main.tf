data "aws_ami" "ec2_ami" {

  most_recent = true             # Fetch the most recent AMI
  owners      = ["099720109477"] # Canonical (official Ubuntu owner)

  # to filter available amis based on name
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.ec2_ami.id
  instance_type = "t3.micro"
  subnet_id     = var.ec2_subnet_id
  tags = {
    Name = var.ec2_instance_name
  }
}