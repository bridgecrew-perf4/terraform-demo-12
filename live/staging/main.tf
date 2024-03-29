terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "banglc-demo-terraform"
    key            = "global/s3/terraform.tfstate"
    region         =  "ap-southeast-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_network_interface" "nic" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "teraform-demo" {
  ami           = "ami-0c20b8b385217763f" 
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
  }
}