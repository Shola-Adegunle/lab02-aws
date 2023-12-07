//////////////////////////////////////////////////////////
/// WEB INSTANCES ///
//////////////////////////////////////////////////////////
resource "aws_instance" "ec2demo" {
  ami                    = data.aws_ami.amz-linux2.id #ami instance from a data source  
  instance_type          = var.instance_type.small
  key_name               = var.key_pair_name
  subnet_id              =  aws_subnet.private-web-subnet-1.id

  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    Name = "EC2 Demo"
  }
}
