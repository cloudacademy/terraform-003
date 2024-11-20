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

resource "aws_s3_bucket" "bucket1" {
  bucket = "terraform-003-bucket-h54cg7vbn6"

  tags = {
    Name        = "terraform-003-bucket-h54cg7vbn6"
    Environment = "Dev"
    Team        = "DevOps"
  }
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "terraform-003-bucket-h54cg7000"

  tags = {
    Name = "terraform-003-bucket-h54cg7000"

    Environment = "Dev"
    Team        = "DevOps"
  }
}
