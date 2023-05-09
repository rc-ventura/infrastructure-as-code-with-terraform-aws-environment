variable "host_os" {
  type    = string
  default = "windows"

}

variable "project" {
  type    = string
 # default = "infra-tf"

}

variable "env" {
  type    = string
  #default = "env"
}

variable "ec2_name" {
  description = " ec2 instance name"
  type = string
}

variable "instance_type" {
  description = "instance type"
  type = string
  default = "t2.micro"
}


 variable "subnet_id" {
   //type = string
   //description = "subnet ID to network interface"
 }


 variable "sg_ingress_ports" {
   type = list(number)
   description = "list of ingress ports"
   default = [ 80, 22, 443 ]
  
}

variable  "security_group_id" {
   //type = string
   // description =
}

variable "user_data_file" {
  //type = string
  //default = file("../../modules/instances/userdata.tpl")
}

 variable "sg_egress_ports" {
   type = list(number)
   description = "list of egress ports"
   default = [ 80, 22, 443 ] 
 }