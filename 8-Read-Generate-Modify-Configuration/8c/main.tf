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

# Data: Fetching an existing VPC
data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "example" {
  name        = var.security_group.name
  description = var.security_group.description
  vpc_id      = data.aws_vpc.default.id

  dynamic "ingress" {
    for_each = var.security_group.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}

output "security_group_id" {
  value = aws_security_group.example.id
}
