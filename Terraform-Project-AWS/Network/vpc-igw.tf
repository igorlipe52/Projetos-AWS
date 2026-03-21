resource "aws_internet_gateway" "igor-igw" {
  vpc_id = aws_vpc.igor-vpc.id

  tags = { Name = var.vpc.internet_gateway_name }
}
