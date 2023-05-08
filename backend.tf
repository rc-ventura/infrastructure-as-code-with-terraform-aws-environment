
# backend configuration

terraform {
  backend "s3" {
    bucket         = "infra-tf-env-mybucket-s3-terraform-state-bucket"
    key            = "terraform/dev/state/terraform.tfstate"
    region         = "us-east-1"
    profile        = "terraform"
    dynamodb_table = "infra-tf-env-terraform-backend-s3-state-lock"

  }
} 