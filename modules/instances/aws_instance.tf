resource "aws_instance" "ec2_node" {
  instance_type          = var.instance_type
  ami                    = var.ami
  key_name               = aws_key_pair.terraform_aws_auth.id
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_id
  user_data              = var.user_data_file


  root_block_device {
    volume_size = 10

  }

  network_interface {
    network_interface_id = aws_network_interface.ec2-cluster-ip.id
    device_index         = 0
  }

  
  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-config.tpl", {
      hostname     = self.public_ip,
      user         = "ubuntu",
      identityfile = "~/.ssh/terraform_aws_key"
    })
    interpreter = var.host_os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]
  }

  
  tags = {
    "Name" = local.instance_name
    "Environment" = var.env
  }
}

resource "aws_key_pair" "terraform_aws_auth" {
  key_name   = "id_rsa"
  public_key = file("~/.ssh/id_rsa.pub")
}








