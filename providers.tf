terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                   = lookup(var.aws_region, local.environment)
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = lookup(var.profile, local.environment)
}