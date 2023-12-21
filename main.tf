terraform {
required_version = ">=0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  provider "aws" {
    region = "us-central-1"
  }

  resource "aws_security_group" "web_app" {
    name        = "web_app"
    description = "security group"

    ingress {
      from_port   = 50
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
      Name = "web_app"
    }
  }

  resource "aws_instance" "webapp_instance" {
    ami           = "ami-0669b163befffbdfc"
    instance_type = "t2.micro"
    security_groups = ["web_app"]

    tags = {
      Name = "webapp_instance"
    }
  }

  output "instance_public_ip" {
    value     = aws_instance.webapp_instance.public_ip
    sensitive = true
  }
}