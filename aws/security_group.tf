resource "aws_security_group" "web_sg" {
  name        = "public_security_group"
  description = "sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "DB traffic"
    from_port = 1433
    to_port = 0
    protocol = "tcp"
    cidrblocks = ["10.0.5.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
