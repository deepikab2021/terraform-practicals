provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIATKPCLECFIHHOSE56"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_instance" "windows" {
  ami = "ami-064d05b4fe8515623"
  tags = {
    Name = "windows-computer"
  }
  instance_type = "t2.micro"
  key_name      = "terraform_windows"
}
resource"aws_security_group" "bhoomi_rdp"{
name="deepu"
description="allow rdp traffic"

ingress{
from_port=3389 # by default, the windows server listens to TCP port 3389 to RDP
to_port=3389
protocol="tcp"

cidr_blocks=["0.0.0.0/0"]
}
}
