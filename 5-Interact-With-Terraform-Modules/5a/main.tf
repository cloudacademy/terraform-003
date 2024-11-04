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

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"
#   # version = "5.15.0"
#   version = "~> 5.15"

#   name = "my-vpc"
#   cidr = "10.0.0.0/16"

#   azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_nat_gateway = false
#   enable_vpn_gateway = false

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }

module "website" {
  # source = "github.com/jeremycook123/s3_static_site_module"
  # source = "github.com/jeremycook123/s3_static_site_module?ref=feature-1"
  # source = "github.com/jeremycook123/s3_static_site_module?ref=v0.0.3"
  # source = "github.com/jeremycook123/s3_static_site_module//s3-hosted-website-bucket?ref=v0.0.1"
  # source = "./modules/static-website"

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
