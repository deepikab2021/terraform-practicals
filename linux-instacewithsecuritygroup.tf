provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIATKPCLECFIHHOSE56"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_instance" "linux" {
  ami = "ami-0b0dcb5067f052a63"
  tags = {
    Name = "webserver"
  }
  instance_type   = "t2.micro"
  key_name        = "terraform-linux"
  security_groups = ["${aws_security_group.jai_ssh.name}"]
}

resource "aws_security_group" "jai_ssh" {
  tags = {
    Name = "JaiSSH"
  }
  name        = "JaiSG"
  description = "allow ssh traffic"

  ingress {
    from_port = 22 # by default, the linux server listens on TCP port 22 for ssh
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

