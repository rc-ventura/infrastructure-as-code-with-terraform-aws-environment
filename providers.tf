# provider "aws" {
#   region                   = lookup(var.aws_region, local.environment)
#   shared_credentials_files = ["C://Users/.aws/credentials"]
#   profile                  = "terraform"
  
#   # lookup(var.profile, local.profile)
# }

provider "aws" {
  region     = "us-west-2"
  access_key = "AKIA5UUN325YDSME74PF"
  secret_key = "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"
}