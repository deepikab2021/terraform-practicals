provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIATKPCLECFIHHOSE56"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-test-bhoomi9963-sahasra4076-s3"
  tags = {
    Name        = "My bucket"
    Environment = "Test"
  }
}
