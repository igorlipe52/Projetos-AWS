resource "aws_eip" "igor-lab-ec2" {
  domain = "vpc"

  tags = {
    Name = "ec2-eip"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id = aws_instance.ec2_instance.id
  allocation_id = aws_eip.igor-lab-ec2.id
}