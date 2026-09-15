terraform {
  required_version = ">= 1.15"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.9"
    }
  }

# use this backend to host the statefile in s3 bucket. without this, it's local
# After, run:
# terraform init -migrate-state in terminal
# rm terraform.tfstate terraform.tfstate.backup
# terraform plan
  backend "s3" {
    bucket       = "bootcamp-2026-haririabd"
    key          = "prometheus/terraform.tfstate"
    region       = "ap-southeast-1"
    use_lockfile = true
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

data "aws_caller_identity" "my_account" {}