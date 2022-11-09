terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "myfirstinstance" {
  ami           = "ami-09d3b3274b6c5d4aa"
  instance_type = "t2.micro"
  key_name = "FirstInstance"
  vpc_security_group_ids = ["sg-02775ecf3038eec4b"]
  user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo echo '<center><h1>My Webshop</h1></center>' > /var/www/html/index.txt
sudo sed /var/www/html/index.txt > /var/www/html/index.html
sudo cd /var/www/html/
sudo service httpd start
EOF
  tags = {
    Name = "MyFirstInstance"
  }
}



