variable "host_os" {
  type    = string
  default = "windows"

}

# Interable input variables --> When I define a variables without default this terraform ask me what is my var.host_os? Linux or windows? 