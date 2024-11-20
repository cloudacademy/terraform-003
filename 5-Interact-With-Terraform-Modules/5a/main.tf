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
  # source = "github.com/jeremycook123/terraform-aws-s3-static-website-3dglobe"
  # source = "git::https://github.com/jeremycook123/terraform-aws-s3-static-website-3dglobe.git"
  # source = "github.com/jeremycook123/terraform-aws-s3-static-website-3dglobe?ref=feature-1"
  # source = "github.com/jeremycook123/terraform-aws-s3-static-website-3dglobe?ref=v0.0.3"
  # source = "github.com/jeremycook123/module_repo1//path/module1?ref=v0.0.1"
  # source = "github.com/jeremycook123/module_repo1//path/module2?ref=v0.0.1"
  # source = "./modules/static-website"

  source  = "jeremycook123/s3-static-website-3dglobe/aws"
  version = "0.0.2"

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
