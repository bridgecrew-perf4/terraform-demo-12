variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
  default     = "None" # Fill your AWS Access Key
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
  default     = "None" # Fill your AWS Secret Key
}

variable "aws_vpc_cidr" {
  description = "AWS VPC range IP"
  type        = string
}

variable "aws_subnet_cidr" {
  description = "AWS subnet range ip"
  type        = string
}

variable "aws_instance_type" {
  description = "AWS Instance type"
  type        = string
}


