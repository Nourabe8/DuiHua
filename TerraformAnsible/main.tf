terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

//resource "aws_key_pair" "key" {
  //key_name = "adminkey"
  //public_key = "${file("${var.key_path}")}"
//}

resource "aws_instance" "master" {
  ami                    = "ami-05fa00d4c63e32376"
  instance_type          = "t2.large"
  key_name               = "exam1"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  user_data              = file("ansibile-install-bash-script.sh")
  tags = {
    Name = var.first_instance_name
  }
}

resource "aws_instance" "node" {
  ami                    = "ami-052efd3df9dad4825"
  instance_type          = "t2.large"
  key_name               = "exam1"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
 // user_data       = "${file("install_jenkins.sh")}"

  tags = {
    Name = var.second_instance_name
  }
}

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Allow Jenkins Traffic"
 

  ingress {
    description      = "Allow from Personal CIDR block"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow SSH from Personal CIDR block"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  


  tags = {
    Name = "Jenkins SG"
  }
}
