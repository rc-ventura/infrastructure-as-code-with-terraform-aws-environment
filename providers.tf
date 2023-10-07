provider "aws" {
  region                   = lookup(var.aws_region, local.environment)
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "terraform"
  
  # lookup(var.profile, local.profile)
}