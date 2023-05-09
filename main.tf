# resource "aws_vpc" "main_vpc" {
#   cidr_block           = "10.123.0.0/16"
#   enable_dns_hostnames = true
#   enable_dns_support   = true

#   tags = {
#     Name = "dev"
#   }
# }

# resource "aws_subnet" "main_public_subnet" {
#   vpc_id                  = aws_vpc.main_vpc.id
#   cidr_block              = "10.123.1.0/24"
#   map_public_ip_on_launch = true
#   availability_zone       = "us-east-1a"

#   tags = {
#     Name = "dev-public"
#   }
# }

resource "aws_internet_gateway" "main_internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.env}-igw"
    Environment = var.env
  }
}

resource "aws_route_table" "main_public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.env}-public_rt"
    Environment = var.env
  }

}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.main_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main_internet_gateway.id
}

resource "aws_route_table_association" "main_public_association" {
  subnet_id      = aws_subnet.main_public_subnet.id
  route_table_id = aws_route_table.main_public_rt.id

}

<<<<<<< Updated upstream
resource "aws_security_group" "main_security_group" {
  name        = "dev_sg"
  description = "Allow inbound and outbound traffic with limits rules"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    description = " Allow only SSH to the VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    // ipv6_cidr_blocks = [aws_vpc.main_vpc.ipv6_cidr_block]
  }

  egress {
    description      = "No limit outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  //tags = {
  //   Name = "allow_tls"
  // }
=======
# resource "aws_security_group" "main_security_group" {
#   name        = "dynamic-dev_sg"
#   description = "Allow inbound and outbound traffic with limits rules"
#   vpc_id      = aws_vpc.main_vpc.id

#   dynamic "ingress" {
#     for_each = var.sg_ingress_ports
#     content {
#       description = " Allow only SSH to the VPC"
#       from_port   = ingress.value 
#       to_port     = ingress.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#   }
#   }

#   dynamic "egress" {
#     for_each = var.sg_egress_ports
#    content {
#         description      = "No limit outbound traffic"
#         from_port        = egress.value
#         to_port          = egress.value
#         protocol         = "tcp"
#         cidr_blocks      = ["0.0.0.0/0"]
#         ipv6_cidr_blocks = ["::/0"]
#   }
#   }

#   tags = {
#      Name = "dynamic-sg"
#      Environment = "dev"
#    }
>>>>>>> Stashed changes

# }

resource "aws_key_pair" "terraform_aws_auth" {
  key_name   = "terraform_aws_key"
  public_key = file("~/.ssh/terraform_aws_key.pub")
}

# resource "aws_instance" "dev-node" {
#   instance_type          = "t2.micro"
#   ami                    = data.aws_ami.server_ami.id
#   key_name               = aws_key_pair.terraform_aws_auth.id
#   vpc_security_group_ids = [aws_security_group.main_security_group.id]
#   subnet_id              = aws_subnet.main_public_subnet.id
#   user_data              = file("userdata.tpl")


#   root_block_device {
#     volume_size = 10

#   }


#   tags = {
#     Name = "dev-node"
#   }

  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-config.tpl", {
      hostname     = self.public_ip,
      user         = "ubuntu",
      identityfile = "~/.ssh/terraform_aws_key"
    })
    interpreter = var.host_os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]
  }

<<<<<<< Updated upstream
}

resource "aws_s3_bucket_object" "object-terraform-state" {
  bucket = "mybucket-s3-terraform-state-bucket"
  key    = "terraform/dev/state/terraform.tfstate"
}

resource "aws_s3_bucket" "s3-terraform-state" {
  bucket = "mybucket-s3-terraform-state-bucket"
  
  tags = {
   
    Name = "s3-bucket"
    Environment = "dev"
  }
  
  
}

resource "aws_dynamodb_table" "terraform-lock" {
  name = "terraform-backend-s3-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    
    name = "LockID"
    type = "S"


  }

  tags = {
     Name = "dynamodb"
     Environment = "dev"
  }
  
}
=======
>>>>>>> Stashed changes

# Any resources can be created with command import in CLI. First you would must to create on aws GUI that resources.
# in second moment create the same resources in terraform. After that in Cli execute the command:
# $ terraform import aws_s3_bucket.mybucket  bucket=name  

<<<<<<< Updated upstream
# to move any resources without to destroy.  Edit one resources without destroy it.
#  edit the resources and execute 
=======

# resource "aws_s3_bucket" "s3-terraform-state" {

#   bucket = "${local.prefix_name}mybucket-s3-terraform-state-bucket"

#   tags = {

#     Name        = "s3-bucket"
#     Environment = "dev"
#   }

# }


# resource "aws_s3_bucket_lifecycle_configuration" "s3-terraform-objects-lifecycle" {

#   bucket = aws_s3_bucket.s3-terraform-state.bucket

#   rule {
#     id     = "delete-objects-on-bucket-deletion"
#     status = "Enabled"

#     filter {
#       prefix = "terraform/dev/state/"
#     }
#     expiration {
#       expired_object_delete_marker = true
#     }
#   }
# }

# resource "aws_dynamodb_table" "terraform-lock" {
#   name         = "${local.prefix_name}terraform-backend-s3-state-lock"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {

#     name = "LockID"
#     type = "S"


#   }

#   tags = {
#     Name        = "dynamodb"
#     Environment = "dev"
#   }

# }


>>>>>>> Stashed changes
