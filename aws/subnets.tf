resource "aws_subnet" "pub_net" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "priv_net" {

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.20.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_subnet" "priv_net_az2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.30.0/24"
  availability_zone = "us-east-1c"   

  tags = {
    Name = "private_subnet_az2"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "my_db_subnet_group"
  subnet_ids = [aws_subnet.priv_net.id, aws_subnet.priv_net_az2.id]

  tags = {
    Name = "my_db_subnet_group"
  }
}