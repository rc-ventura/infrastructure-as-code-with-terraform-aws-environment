variable "instance_name" {
  description = "the instance name" 
  type = string
}

variable "ami" {
  type = string
  description = "the AMI id"
}

variable "instance_type" {
  type = string
  description = "the instance type"
}

variable "env" {
  type = string
  description = "environment to deploy"
}

variable "subnet_id" {
  type = string
  description = "subnet id to network interface"
}

variable "network_prefix" {
  type = string
  description = "the network prefix to vpc and subnet"
}


variable "host_os" {
  type    = string
  default = "windows"

}

variable "project" {
  type    = string
 # default = "infra-tf"

}


variable "ec2_name" {
  description = " ec2 instance name"
  type = string
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

# variable "user_data_file" {
#   type = string
#    default = file("../../modules/instances/userdata.tpl")
# }



 variable "sg_egress_ports" {
   type = list(number)
   description = "list of egress ports"
   default = [ 80, 22, 443 ] 
 }