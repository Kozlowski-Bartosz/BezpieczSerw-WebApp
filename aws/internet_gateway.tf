resource "aws_internet_gateway" "gataway" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.pub_net.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "priv" {
  subnet_id      = aws_subnet.priv_net.id
  route_table_id = aws_route_table.private.id
}