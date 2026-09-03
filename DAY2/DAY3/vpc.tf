provider "aws" {
  
}

### Create Vpc ###### 

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
    Name = "my-1vpc"    
    }
  
}



###### Create a  Subnet in that VPC which is Already Created##


resource "aws_subnet" "new-subnet" {
vpc_id =   aws_vpc.my_vpc.id
cidr_block = "10.0.0.0/20"

tags = {
  Name = "My-Subnet"
}
}

#### Create Second SubNet ###
resource "aws_subnet" "new-subnet-1" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/20"

  tags = {
    Name = "My-subnet-2"
  }
}

##### Create a internet gateway #####

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
      Name = "my-internet-gateway"
    }
  
}