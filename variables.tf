variable "aws_region" {
  description = "aws region where the resources will be created"

  type = object({
    dev     = string
    homolog = string
    prod    = string
  })

  default = {
    dev     = "us-west-2"
    homolog = "us-west-2"
    prod    = "us-west-2"
  }

}

variable "instance" {
  description = "instance set configuration per workspace"

  type = object({
    dev = object({
      ami  = string
      type = string
    })
    homolog = object({
      ami  = string
      type = string
    })
    prod = object({
      ami  = string
      type = string
    })
  })

  default = {
    dev = {
      ami  = "ami-052efd3df9dad4825"
      type = "t2.micro"
    }
    homolog = {
      ami  = "ami-052efd3df9dad4825"
      type = "t2.micro"
    }
    prod = {
      ami  = "ami-052efd3df9dad4825"
      type = "t2.medium"
    }
  }
}

variable "network_prefix" {
  description = "prefix to create the network"
  type = object({
    dev     = string
    homolog = string
    prod    = string
  })

  default = {
    dev     = "10.0.1"
    homolog = "10.0.2"
    prod    = "10.0.3"

  }
}


variable "profile" {
  description = "set profile user aws account "
  type = object({
    dev     = string
    homolog = string
    prod    = string
  })



  default = {
    dev     = "dev"
    homolog = "homolog"
    prod    = "prod"

  }
}

variable "ec2_name" {
  description = "ec2 instance name"
  type        = string
  default     = "terraform-ec2"
}

variable "vpc_name" {
  description = "vpc name"
  type        = string
  default     = "terraform-vpc"
}

variable "subnet_name" {
  description = "subnet name"
  type        = string
  default     = "terraform-subnet"

}


variable "host_os" {
  type    = string
  default = "windows"

}


variable "project" {
  description = "value"
  type        = string
  default     = "terraform-project"

}



variable "sg_ingress_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [80, 22, 443]

}

variable "sg_egress_ports" {
  type        = list(number)
  description = "list of egress ports"
  default     = [80, 22, 443]
}
