terraform {
  required_version = ">= 1.9"
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

variable "test_1" {
  type    = string
  default = "weird value"
}

variable "test_2" {
  type    = number
  default = "weird value"
}

resource "aws_vpc" "vpc" {
  cidr_block = "weird value"
  # # cidr_block = "10.10.10.0/22"
  # cidr_block = "10.10.8.0/22"
}

resource "aws_subnet" "subnet_a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.0.0/24"
}
