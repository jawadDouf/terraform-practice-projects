# aws ec2 terraform main file
provider "aws" {
  profile = "default"
  region = "us-east-1"
}


# data block => to get a specific ami of an ec2 instance
data "aws_ami" "ec2_ami" {

        most_recent = true                     # Fetch the most recent AMI
        owners      = ["099720109477"]         # Canonical (official Ubuntu owner)

        # to filter available amis based on name
          filter {
                name   = "name"
                values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
             }
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ec2_ami.id  # Use the fetched AMI ID
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}