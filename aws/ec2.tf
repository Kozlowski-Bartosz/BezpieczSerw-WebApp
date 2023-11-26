# TODO: move bastion to another subnet
resource "aws_instance" "bastion" {
  ami                    = "ami-0aa2b7722dc1b5612"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.primary_key.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.pub_net.id


  tags = {
    Name = "ubuntu-instance"
  }
}

resource "aws_instance" "web-app2" {
  ami                    = "ami-0aa2b7722dc1b5612"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.primary_key.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.priv_net.id

  tags = {
    Name = "ubuntu-instance-webapp2"
  }
}

resource "aws_instance" "web-app1" {
  ami                    = "ami-0aa2b7722dc1b5612"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.primary_key.key_name
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  subnet_id              = aws_subnet.priv_net.id

  tags = {
    Name = "ubuntu-instance-webapp1"
  }
}
