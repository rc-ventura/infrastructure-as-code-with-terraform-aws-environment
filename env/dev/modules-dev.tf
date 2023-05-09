module "instance" {
  source   = "../../modules/instances"
  ec2_name = "module-ec2-instance" // colocar um count 
  project  = "aws-terraform-env"
  subnet_id = module.network.subnet_id
  security_group_id = module.network.security_group_id
  env      = local.environment
  user_data_file = file("../../modules/instances/userdata.tpl")
  
  



}



module "network" {
  source      = "../../modules/network"
  subnet_name = "module-subnet"
  vpc_name    = "module-vpc"
  env         = local.environment
  //sg_ingress_ports = var.ingress_ports
 // sg_egress_ports = var.egress_ports

}

