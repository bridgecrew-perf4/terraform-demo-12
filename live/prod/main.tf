terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket         = "banglc-demo-terraform"    # Change your bucket name
    key            = "global/s3/terraform.tfstate"
    region         =  "ap-southeast-1" 
    dynamodb_table = "terraform-state-locks"    # Change your DynamoDB table name
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "simple_webserver-1" {
  source = "../../modules/simple-webserver"

  aws_vpc_cidr = "172.16.0.0/16"
  aws_subnet_cidr = "172.16.10.0/24"
  aws_instance_type = "t2.small"
}



