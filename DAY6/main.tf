provider "aws" {
    region = var.region_name

}

resource "aws_instance" "new-instance" {
  
instance_type = var.instance_type
ami = var.image_name
key_name = var.key_name
vpc_security_group_ids = [var.sg]

user_data = <<-EOF
            #!/bin/bash
            yum install httpd -y
            systemctl start httpd
            systemctl enable httpd
            echo "<h> This is USER-DATA Inside Terraform File </h>" > /var/www/html/index.html
            EOF

tags = {
    Name = "User-Data"
}
}
