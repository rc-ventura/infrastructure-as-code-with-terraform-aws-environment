variable "env" {
    description = "provisioned environment"
    type = string
}


variable "region" {
  type = string
  default = "us-east-1"
  description = "region to AZ"
}

variable "network_prefix" {
  type = string
  description = "the subnet network prefix"
}


variable "vpc_name" {
    description = "vpc name"
    type = string
}

variable "subnet_name" {
    description = "subnet name"
    type = string
}

variable "sg_ingress_ports" {
  type = list(number)
  description = "list of ingress ports"
  default = [ 80, 22, 443 ]
  
}

variable "sg_egress_ports" {
  type = list(number)
  description = "list of egress ports"
  default = [ 80, 22, 443 ] 
}
