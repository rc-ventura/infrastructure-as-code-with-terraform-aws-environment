
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
  //user_data    = file("./modules/instances/userdata.tpl")


}

module "network" {
  source         = "./modules/networks"
  network_prefix = lookup(var.network_prefix, local.environment)
  region         = lookup(var.aws_region, local.environment)
  env            = local.environment
  vpc_name       = var.vpc_name
  subnet_name    = var.subnet_name

}



module "storage" {
  source           = "./modules/storages"
  env              = local.environment
  project          = var.project
  is_dev_workspace = local.is_dev_workspace

}


/*module "backend" {
  source = "./modules/backend"
  bucket_id = module.storage.bucket_id
  dynamodb_id = module.storage.dynamodb_id
  region_id =  var.aws_region

}

*/






