# Initialize the awas provider
provider "aws" {

    region = "us-east-1"
}


# get the red hat linux destribution ami-id
data "aws_ami" "redhat_distro" {
        most_recent = true                   
        owners      = ["309956199498"]    

        filter {
                name   = "name"
                values = ["RHEL-8.6*_HVM-*-x86_64-*"]
             }
        
       filter {
                name   = "architecture"
                values = ["x86_64"]
             }

}

# initialize the ssh key-pair
resource "aws_key_pair" "deployer" {

  key_name   = "terraform-key"
  public_key = file("~/.ssh/id_ed25519.pub")

}

# add security group to control incoming traffic 
resource "aws_security_group" "nginx_cont_sg" {

  name="allow-http-ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  
  }

}


resource "aws_instance" "redhat_ec2_instance" {
  ami           = data.aws_ami.redhat_distro.id
  instance_type = "t2.micro"
  key_name                    = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = [aws_security_group.nginx_cont_sg.id]

  user_data = file("cloud-init-config.yaml")

  tags = {
    Name = "RHEL-8.6-Instance"
  }
}
