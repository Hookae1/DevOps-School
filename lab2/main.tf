terraform {
    required_providers {
        aws = {
            source              = "hashicorp/aws"
            version             = "~> 3.27"
        }
    }
}

provider "aws" {
    profile                     = "default"
    region                      = "eu-central-1"
}

resource "aws_instance" "terraform_learn" {
    ami                         = "ami-0a49b025fffbbdac6"
    instance_type               = "t2.micro"
    vpc_security_group_ids      = [aws_security_group.terraform_learn.id]
    key_name                    = "aws_key"
    user_data                   = file("web.sh")

    tags = {
        Name                    = "terraform_lab"
    }
}

resource "aws_iam_user" "terraform_learn"{
    name                        = "terrafrom"
    path                        = "/"
}

resource "aws_security_group" "terraform_learn" {
    name                        = "Security_228"
    description                 = "Security group done by Terraform"

    ingress {
        from_port               = 80
        to_port                 = 80
        protocol                = "TCP"
        cidr_blocks             = ["0.0.0.0/0"]
    }

    ingress {
        from_port               = 443
        to_port                 = 443
        protocol                = "TCP"
        cidr_blocks             = ["0.0.0.0/0"]
    }

    ingress {
        from_port               = 22
        to_port                 = 22
        protocol                = "TCP"
        cidr_blocks             = ["0.0.0.0/0"]
    }

    egress {
        from_port               = 0
        to_port                 = 0
        protocol                = "-1"
        cidr_blocks             = ["0.0.0.0/0"]
    }
}
  

