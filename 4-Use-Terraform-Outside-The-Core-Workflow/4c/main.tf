terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.70"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.1"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "random_pet" "suffix" {
  separator = ""
}

locals {
  bucket_name = "terraform-003-${random_pet.suffix.id}"
}

resource "aws_s3_bucket" "website" {
  bucket        = local.bucket_name
  force_destroy = true
}
