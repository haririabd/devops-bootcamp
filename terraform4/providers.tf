terraform {
  required_version = ">= 1.15"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.64"
    }
  }

  backend "s3" {
    bucket       = "bootcamp-2026-haririabd"
    key          = "terraform4/terraform.tfstate"
    region       = "ap-southeast-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

data "aws_caller_identity" "my_account" {}