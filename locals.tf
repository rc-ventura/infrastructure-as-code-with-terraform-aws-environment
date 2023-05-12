locals {
  environment = terraform.workspace == "default" ? "dev" : terraform.workspace
  profile     = terraform.workspace == "default" ? "dev" : terraform.workspace

  is_dev_workspace = terraform.workspace == "dev"


}



