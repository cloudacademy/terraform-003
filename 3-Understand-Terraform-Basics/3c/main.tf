terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.63.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

provider "azurerm" {
  # configuration options here
}

resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc1-tf003"
  }
}

resource "aws_vpc" "vpc2" {
  provider   = aws.us_east_1
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc2-tf003"
  }
}
