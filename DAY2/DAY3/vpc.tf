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
availability_zone = "ap-south-1c"
tags = {
  Name = "My-Subnet"
}
}

#### Create Second SubNet ###
resource "aws_subnet" "new-subnet-1" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.16.0/20"

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

#### Create Route Table ####
resource "aws_route_table" "my_new_rt" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "My-new-public-rt"
  }
}

##### Create Default Route Table ####
resource "aws_route" "default_route" {
  route_table_id = aws_route_table.my_new_rt.id
destination_cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.my_igw.id

}

### Associated with 1 subnet ###
resource "aws_route_table_association" "public_subnet" {
subnet_id = aws_subnet.new-subnet.id  
route_table_id = aws_route_table.my_new_rt.id
}

#### Create a SG ########33

resource "aws_security_group" "my_sg" {
  name        = "my-terraform-sg"
  description = "Security group created using Terraform"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "My-Terraform-SG"
  }
}