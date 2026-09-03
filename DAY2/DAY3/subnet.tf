###### Create a  Subnet in that VPC which is Already Created##
provider "aws" {
  
}


resource "aws_subnet" "new-subnet" {
vpc_id =   "vpc-0c66533582604ff8c"
cidr_block = "10.0.0.0/20"

tags = {
  Name = "My-Subnet"
}
}

