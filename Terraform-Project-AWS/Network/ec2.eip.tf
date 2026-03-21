resource "aws_eip" "eip-nat" {
  domain = "vpc"

  tags = { Name = var.vpc.internet_gateway_name }
}