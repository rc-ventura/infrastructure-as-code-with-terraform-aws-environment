locals {
  environment = terraform.workspace == "default" ? "dev" : terraform.workspace
}