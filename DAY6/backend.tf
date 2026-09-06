terraform {
  backend "s3" {
    bucket = "my-new-backend-bucket"
    key = "terraform.tfstate"
    region = "ap-south-1"
  }
}