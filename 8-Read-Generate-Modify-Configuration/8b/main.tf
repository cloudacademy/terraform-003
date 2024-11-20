terraform {
  required_version = ">=1.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.70"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "4.4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address          = "http://localhost:8200"
  skip_child_token = true

  #   auth_login {
  #     path = "auth/approle/login"

  #     parameters = {
  #       role_id   = "31774471-2dd7-698c-1dc8-1b32a113aa8e"
  #       secret_id = "e6dfa88f-8588-e607-a20e-87a93dc09ec9"
  #     }
  #   }
}

data "vault_kv_secret_v2" "example" {
  mount = "secret"
  name  = "cloudacademy"
}

output "access_key" {
  value     = data.vault_kv_secret_v2.example.data["access_key"]
  sensitive = true
}
