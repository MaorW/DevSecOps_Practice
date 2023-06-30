variable "vpc_cidr" {
  description   = "Value of the CIDR range for the VPC"
  type          = string
  default       = "10.0.0.0/16"
}

variable "vpc_name" {
  description   = "Value of the name for the VPC"
  type          = string
  default       = "myTestVPC"
}

variable "subnet_cidr" {
  description   = "Value of the subnet cidr for the VPC"
  type          = string
  default       = "10.0.1.0/24"
}

variable "subnet_name" {
  description   = "Value of the subnet name for the VPC"
  type          = string
  default       = "myTestSubnet"
}

variable "igw_name" {
  description   = "Value of the name for the VPC"
  type          = string
  default       = "myTestIGW"
}

variable "ec2_name" {
  description   = "Value of the EC2 name"
  type          = string
  default       = "MyTestEC2"
}

# Getting the most recent AMI ID of the "Amazon Linux 2023" AMI by filters
data "aws_ami" "al2023" {
  most_recent   = true
  owners        = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.0.20230607.0-kernel-6.1-x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}