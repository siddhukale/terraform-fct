
provider "aws" {
  
}

resource "aws_instance" "fct-instance" {
  ami           = "ami-090d68841c2a28756"
  instance_type = "t3.micro"
  count = 3
  tags = {
    Name = "first-instance"
  }
}