
##### Create s3 backend bucket for storing terraform.tfstate file ###

terraform {
  backend "s3" {
    bucket = "my-new-backend-bucket"
    key = "terraform.tfstate"
    region = "ap-south-1"
  }
}