terraform {
  required_version = ">=1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.70"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

module "network1" {
  source = "./modules/network"

  cidr = var.cidr
  tags = {
    Name = "vpc1-tf003-network1"
  }
}

output "vpc_id" {
  value = module.network.vpc_id
}
