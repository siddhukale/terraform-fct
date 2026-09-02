
provider "aws" {
  
}

# resource "aws_instance" "fct-instance" {
#   ami           = "ami-090d68841c2a28756"
#   instance_type = "t3.micro"
#   count = 3
#   tags = {
#     Name = "first-instance"
#   }
# }

# resource "aws_instance" "fct-instance-2" {
#     for_each = toset(["jump server","application server","db server"])
#  instance_type = "t3.micro" 
#  ami = "ami-090d68841c2a28756"
#  tags = {
#    Name = each.key
#  }
# }

resource "aws_instance" "fct-instance-2" {
 instance_type = "t3.micro" 
 count = 3
 ami = "ami-090d68841c2a28756"
 tags = {
   Name = "web-server-${count.index}"
 }
}

