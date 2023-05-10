terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials", "~/.aws/credentials-dev", "~/.aws/credentials-homolog" ]
  profile                  = ["terraform", "terraform-dev", "terraform-homolog"]
}