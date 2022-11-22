provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIATKPCLECFIHHOSE56"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_instance" "linux" {
  ami = "ami-08c40ec9ead489470"
  tags = {
    Name = "linux computer"
  }
  instance_type = "t2.nano"
  count         = 5
  key_name      = "terraform-linux"
}

