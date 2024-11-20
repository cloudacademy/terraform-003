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
  region = "us-east-1"
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cidr1" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/20"
}

module "network1" {
  source = "./modules/network"

  cidr = var.cidr
  tags = {
    Name = "vpc1-tf003-network1"
  }
}

module "network2" {
  source = "./modules/network"

  cidr = var.cidr1
  tags = {
    Name = "vpc1-tf003-network2"
  }
}

output "vpc_id" {
  value = module.network1.vpc_id
}

output "vpc_id1" {
  value = module.network2.vpc_id
}
