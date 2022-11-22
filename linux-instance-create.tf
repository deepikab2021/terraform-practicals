provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIATKPCLECFIHHOSE56"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_instance" "linux" {
  ami = "ami-08e167817c87ed7fd"
  tags = {
    Name = "linux-computer"
  }
  instance_type = "t2.micro"
  key_name      = "terraform-linux"
}

resource "aws_security_group" "allow_ssh" {
  tags = {
    Name = "Bhoomi_SSH"
  }
  name        = "BhoomiSG"
  description = "allow BhoomiSG traffic"


  ingress {
    from_port = 22 # by default, the linux server listens on TCP port 22 for SSH
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}



