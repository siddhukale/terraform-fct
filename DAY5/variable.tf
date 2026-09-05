#### creat variable file 

variable "region_name" {
default = "ap-south-1"
}
variable "ami_image" {
default = "ami-090d68841c2a28756"
}

variable "instance_config" {
    default = "t3.micro"
  
}

variable "my_sg" {
  default = "sg-04ac1d41063a71696"
}

variable "key_name" {
    default = "siddhesh-key"
  
}

variable "my_subnet" {
  default = "subnet-00ecb13ce28393ab9"
}
