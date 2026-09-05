
provider "aws"  {
    region = var.region_name
  
}

resource "aws_instance" "my_instance" {
  ami = "ami-090d68841c2a28756"
  instance_type = "t2.micro"
  key_name = "siddhesh-key"
vpc_security_group_ids = [ "sg-04ac1d41063a71696" ]

  tags ={
    Name = "web-server"
  } 
}
