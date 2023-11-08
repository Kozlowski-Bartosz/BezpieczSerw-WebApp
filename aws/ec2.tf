# TODO: move bastion to another subnet
resource "aws_instance" "bastion" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.primary_key.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.pub_net.id


  tags = {
    Name = "ubuntu-instance"
  }
}

resource "aws_instance" "staging" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.primary_key.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.priv_net_az2.id

  tags = {
    Name = "ubuntu-instance-staging"
  }
}
