
module "instance" {
  source            = "./modules/instances"
  instance_name     = "module-ec2-instance"
  project           = var.project
  ec2_name          = var.ec2_name
  subnet_id         = module.network.aws_subnet_id
  security_group_id = module.network.security_group_id
  ami               = lookup(var.instance, local.environment)["ami"]
  instance_type     = lookup(var.instance, local.environment)["type"]
  network_prefix    = lookup(var.network_prefix, local.environment)
  env               = local.environment
  user_data_file    = file("./modules/instances/userdata.tpl")


}

module "network" {
  source         = "./modules/network"
  network_prefix = lookup(var.network_prefix, local.environment)
  region         = lookup(var.aws_region, local.environment)
  env            = local.environment
  vpc_name       = var.vpc_name
  subnet_name    = var.subnet_name

}

# module "storage" {
#   source                   = "./modules/storages"

# }




