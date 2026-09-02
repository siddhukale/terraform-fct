#resource "local_file" "fct" {
 # content  = "welcome in fct pune!"
 # filename = "/root/fct.txt"
#}

// to create ec2 instance 

#provider "aws" {
 # region = "ap-south-1"
#}

resource "aws_instance" "fct-instance" {
  ami           = "ami-090d68841c2a28756"
  instance_type = "t3.micro"

  tags = {
    Name = "first-instance"
  }
}