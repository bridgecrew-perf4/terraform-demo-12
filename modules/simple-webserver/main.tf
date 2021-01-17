terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.aws_vpc_cidr

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.aws_subnet_cidr
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_network_interface" "nic" {
  subnet_id   = aws_subnet.my_subnet.id

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "teraform-demo" {
  ami           = "ami-0c20b8b385217763f" 
  instance_type = var.aws_instance_type

  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
  }
}


