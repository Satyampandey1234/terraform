terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version= "5.23.1"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"

  tags = {
    #Name = var.name
  }
  lifecycle {
      #create_before_destroy = true
    }

  
}
output "instanceIP" {
  value = aws_instance.web.public_ip

}
