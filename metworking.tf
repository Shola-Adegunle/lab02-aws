//////////////////////////////////////////////////////////
/// VPC ///
//////////////////////////////////////////////////////////
resource "aws_vpc" "terraform-vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = "true"
  tags = {
    Name = var.vpc_name # Name needs to be with an uppercase 
  }
  }


//////////////////////////////////////////////////////////
/// SUBNETS ///
//////////////////////////////////////////////////////////
resource "aws_subnet" "private-web-subnet-1" {
  cidr_block = var.private_web_sub1_cidr
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name = "private-web-subnet-1" # must add a name tag
  
  }
}


//////////////////////////////////////////////////////////
/// SECURITY GROUPS ///
//////////////////////////////////////////////////////////
#############################################
# Allow SSH access from anywhere 
resource "aws_security_group" "vpc-ssh" {
  name        = "allow-tls"
  description = "Dev VPC SSH"
  vpc_id      = aws_vpc.terraform-vpc.id # need to specify the vpc
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outbound access to anywhere 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc-ssh"
  }
}


###########################################
# Allow HTTP access from anywhere
resource "aws_security_group" "vpc-web" {
  name        = "allow-http-traffic"
  description = "Dev VPC Web"
  vpc_id      = aws_vpc.terraform-vpc.id # need to specify the vpc
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outbound access to anywhere 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "vpc-web"
  }
}