resource "aws_route_table" "public" {
  vpc_id = aws_vpc.igor-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igor-igw.id
  }

  tags = { Name = var.vpc.public_route_table_name }
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
