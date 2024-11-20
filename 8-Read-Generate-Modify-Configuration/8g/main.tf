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

data "template_file" "bootstrap_script" {
  template = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > /var/log/bootstrap.log
  EOF
}

resource "aws_instance" "linux_instance" {
  ami           = "ami-0b0ea68c435eb488d"
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_ssh.name]

  # Implicit dependency - User data for bootstrapping the instance using the script from the data resource
  user_data = data.template_file.bootstrap_script.rendered

  # Explicit dependency to ensure the security group is created first
  depends_on = [aws_security_group.allow_ssh]
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

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
