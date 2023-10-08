

resource "aws_vpc" "virtual-network" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }

}

resource "aws_subnet" "virtual-subnet" {
  vpc_id                  = aws_vpc.virtual-network.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev-public"
  }

}

resource "aws_internet_gateway" "virtual-igw" {
  vpc_id = aws_vpc.virtual-network.id

  tags = {
    Name = "dev-igw"
  }

}

resource "aws_route_table" "virtual-rt" {
  vpc_id = aws_vpc.virtual-network.id

  tags = {
    Name = "dev-public-rt"
  }

}

resource "aws_route" "virtual-route" {
  route_table_id         = aws_route_table.virtual-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.virtual-igw.id

}

resource "aws_route_table_association" "virtual-rt-aws_route_table_assoc" {
  subnet_id      = aws_subnet.virtual-subnet.id
  route_table_id = aws_route_table.virtual-rt.id

}

resource "aws_security_group" "virtual-sg" {
  name        = "dev-sg"
  description = "dev security group"
  vpc_id      = aws_vpc.virtual-network.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.virtual-network.cidr_block]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.virtual-network.cidr_block]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.virtual-network.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "dev-sg"
  }
}



resource "aws_key_pair" "terraform_aut_key" {
  key_name   = "terraform_auth_key"
  public_key = file("terraform_auth_key.pub")

}

resource "aws_instance" "dev_node" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.server_ami.id
  key_name = aws_key_pair.terraform_aut_key.id
  vpc_security_group_ids = [ aws_security_group.virtual-sg.id ]
  subnet_id = aws_subnet.virtual-subnet.id
  user_data = file("userdata.tpl")


  root_block_device {
    volume_size = 20
  }

  tags = {
    Name = "dev-node"
  }

  provisioner "local-exec" {
    command = templatefile("linux-ssh-config.tpl", {
          hostname = self.public_ip,
          user = "ubuntu" ,
          identityfile = "~/.ssh/terraform_auth_key"
          }
      )
    # interpreter = [ "Powershell", "-Command" ]
     interpreter = ["bash", "-c"]
  
}
}