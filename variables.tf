variable "host_os" {
  type    = string
  default = "windows"

}

variable "project" {
  type    = string
  default = "infra-tf"

}

variable "env" {
  type    = string
  default = "env"
}

variable "sg_ingress_ports" {
  type = list(number)
  description = "list of ingress ports"
  //default = [ 80, 22, 443 ]
  
}

variable "sg_egress_ports" {
  type = list(number)
  description = "list of egress ports"
  default = [ 80, 22, 443 ] 
}