provider "aws" {
    region = var.region_name

}

resource "aws_instance" "new-instance" {
  
instance_type = var.instance_type
ami = var.image_name
# key_name = var.key_name
vpc_security_group_ids = [data.aws_security_group.sg.id]       #<---- data block use krun mention sg manual                                     #  variable create -  [var.sg]
# subnet_id = var.subnet_id
#  associate_public_ip_address = true

# user_data = <<-EOF
#             #!/bin/bash
#             yum install httpd -y
#             systemctl start httpd
#             systemctl enable httpd
#             echo "<h> This is USER-DATA Inside Terraform File </h>" > /var/www/html/index.html
#             EOF

tags = {
    Name = "New_Server"
}
}

data "aws_security_group" "sg" {
  name = "siddhesh-sg"
  vpc_id = "vpc-0c77f39b62d802dfa"
}