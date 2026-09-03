
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

##### It's a not runed on git and terraform server try this 
# resource "aws_instance" "fct-instance-2" {
#  instance_type = "t3.micro" 
#  count = 3
#  ami = "ami-090d68841c2a28756"
#  key_name = "siddhesh-key"
#  security_groups = ["sg-06d252d7082da7d52"]
#  tags = {
#    Name = "web-server${count.index+1}"
#  }
# }

