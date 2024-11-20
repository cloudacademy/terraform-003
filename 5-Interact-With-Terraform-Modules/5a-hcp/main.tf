terraform {
  cloud {
    organization = "cloudacademy"
    workspaces {
      name = "terraform-003"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "s3_website_3dglobe" {
  source  = "app.terraform.io/cloudacademy/s3-static-website-3dglobe/aws"
  version = "0.0.3"

  bucket_name          = "bucket-1234abcd"
  create_random_suffix = true
  environment          = "staging"

  tags = {
    Terraform = "true"
  }
}

output "website-endpoint" {
  value = "http://${module.s3_website_3dglobe.bucket_website_endpoint}"
}
