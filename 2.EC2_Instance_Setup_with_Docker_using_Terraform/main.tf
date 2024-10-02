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


resource "aws_instance" "redhat_ec2_instance" {
  ami           = data.aws_ami.redhat_distro.id
  instance_type = "t2.micro"

  user_data = file("cloud-init-config.yaml")

  tags = {
    Name = "RHEL-8.6-Instance"
  }
}
