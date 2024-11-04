terraform {
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

# resource "aws_s3_bucket" "bucket1" {
#   bucket = "qa-bucket-crby3"
# }
