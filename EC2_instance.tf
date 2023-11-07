terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version= "5.23.1"
    }
  }
}
/*
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA6KX5DAAMJYSPHRNW"
  secret_key = "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"
}
*/

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"

  tags = {
    Name = var.name
  }
  lifecycle {
      #create_before_destroy = true
    }

  provisioner "local-exec" {
      command= "echo ${aws_instance.web.private_ip} >> output.txt"
    
    }  
  provisioner "remote-exec" {
      inline = [ "sudo apt-get install apache2 -y" ]
  }
}
output "instanceIP" {
  value = aws_instance.web.public_ip

}