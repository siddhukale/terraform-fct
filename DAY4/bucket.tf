provider "aws" {
  
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "my-new-fct-terraform-bucket"
    tags = {
      Name = "my-terraform-bucket"
      Environment = "Dev"
    }
  
}
