## Create a EC2 instance using main.tf with varible. #######

provider "aws"  {
    region = var.region_name
  
}

resource "aws_instance" "my_instance" {
 # ami = "ami-090d68841c2a28756"
  ami = var.ami_image
  
  # instance_type = "t3.micro"
  instance_type = var.instance_config

 # key_name = "siddhesh-key"
 key_name = var.key_name

  #subnet_id = "subnet-00ecb13ce28393ab9"
  subnet_id = var.my_subnet

  # vpc_security_group_ids = [ "sg-04ac1d41063a71696" ]
  vpc_security_group_ids = [var.my_sg]

  tags = {
    Name = "web-server"
  } 
}
