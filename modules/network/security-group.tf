resource "aws_security_group" "main_security_group" {
  name        = "dynamic-dev_sg"
  description = "Allow inbound and outbound traffic with limits rules"
  vpc_id      = aws_vpc.main_vpc.id

  dynamic "ingress" {
    for_each = var.sg_ingress_ports
    content {
      description = " Allow only SSH to the VPC"
      from_port   = ingress.value 
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  }

  dynamic "egress" {
    for_each = var.sg_egress_ports
   content {
        description      = "No limit outbound traffic"
        from_port        = egress.value
        to_port          = egress.value
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
  }
  }

  tags = {
     Name = "dynamic-sg"
     Environment = "dev"
   }

}
