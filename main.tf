provider "aws" {
  region = var.region
}

resource "aws_key_pair" "strapi_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "strapi_sg" {
  name        = "strapi-sg"
  description = "Allow SSH and Strapi ports"

  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "strapi_ec2" {
  ami                         = "ami-042b4708b1d05f512"  # Ubuntu 22.04 LTS (eu-north-1)
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.strapi_key.key_name
  vpc_security_group_ids      = [aws_security_group.strapi_sg.id]
  associate_public_ip_address = true

  # ✅ Bigger disk size
  root_block_device {
    volume_size = 20
    volume_type = "gp2"
  }

  tags = {
    Name = "Strapi-Ubuntu"
  }
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance running Strapi"
  value       = aws_instance.strapi_ec2.public_ip
}

