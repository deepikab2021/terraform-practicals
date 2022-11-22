# provider information
provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIATKPCLECFIHHOSE56"
  secret_key = "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"
  region     = "us-east-1"
}

# terraform code to signup EC2 instance
resource "aws_instance" "linux" {
  ami             = "ami-0b0dcb5067f052a63"
  security_groups = ["${aws_security_group.allow_ssh_http.name}"]
  tags = {
    Name = "linux webserver"
  }
  instance_type = "t2.micro"
  key_name      = "terraform-linux"

  # user data script in AWS EC2 by using terraform

  user_data = file("script.sh")
}

resource "aws_security_group" "allow_ssh_http" {
  tags = {
    Name = "webserverssh"
  }
  name        = "webserverSG"
  description = "allow ssh & http traffic"

  vpc_id = "vpc-066e5ba8236ea168e"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
