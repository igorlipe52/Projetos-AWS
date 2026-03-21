resource "aws_vpc" "igor-vpc" {
  cidr_block = var.vpc.cidr_block

  tags = { Name = var.vpc.name }
}
