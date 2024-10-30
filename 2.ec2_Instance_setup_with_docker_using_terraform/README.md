# EC2 Instance with Docker Setup using Terraform
This project demonstrates the use of Terraform to provision an AWS EC2 instance and automatically install Docker on it. It serves as a simple setup to run a Docker container (in this case, an Nginx web server) on a remote EC2 instance.


## Project Overview
The Terraform configuration in this repository automates the following tasks:

1. Creates an AWS EC2 instance using a specified AMI.
2. Configures security groups to allow SSH (port 22) and HTTP (port 80) access.
3. Installs Docker on the EC2 instance using a user data script.
4. Automatically runs an Nginx Docker container, which can be accessed via the public IP of the EC2 instance.
