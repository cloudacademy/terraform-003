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

# Create a security group
resource "aws_security_group" "example_sg" {
  name        = "example_sg"
  description = "Allow SSH access"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance that uses the security group created above
resource "aws_instance" "example_instance" {
  ami           = "ami-0b0ea68c435eb488d"
  instance_type = "t2.micro"

  # Use the security group by referencing it via its name
  security_groups = [aws_security_group.example_sg.name]

  tags = {
    Name = "example-instance"
  }
}
