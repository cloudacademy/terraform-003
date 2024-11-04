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

module "website" {
  source  = "jeremycook123/s3-static-website-3dglobe/aws"
  version = "0.0.3"

  bucket_name          = "bucket-1234abcd"
  create_random_suffix = true
  environment          = "staging"

  tags = {
    Terraform = "true"
  }
}

output "website-endpoint" {
  value = "http://${module.website.bucket_website_endpoint}"
}
