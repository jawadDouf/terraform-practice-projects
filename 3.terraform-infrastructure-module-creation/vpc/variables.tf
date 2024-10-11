# vpc variales
variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type = string
  default = "main_vpc"
}
# public sunet variales
variable "public_subnet_cidr" {
  type = string
  default = "10.0.2.0/24"
}

variable "public_subnet_az" {
  type = string
  default = "us-east-1b"
}

variable "public_subnet_name" {
  type = string
  default = "public_subnet"
}

# private subnet variales
variable "private_subnet_cidr" {
  type = string
  default = "10.0.2.0/24" 
}

variable "private_subnet_az" {
  type = string
  default = "us-east-1a"
}

variable "private_subnet_name" {
  type = string
  default = "private_subnet"
}