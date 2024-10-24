provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}


#Provisionando IaC - Projeto Terraform 



   #1 - Criar VPC

   resource "aws_vpc" "produção-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "produção"
  }
}

   #2 - Criar Internet Gateway

   resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.produção-vpc.id

  tags = {
    Name = "produção"
  }
}

   #3 - Criar Route Table Customizado

   resource "aws_route_table" "produção-route-table" {
  vpc_id = aws_vpc.produção-vpc.id

  route {
    cidr_block = "0.0.0.0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "produção"
  }
}

   #4 - Criar Subnet

   resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.produção-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1"

  tags = {
    Name = "produção"
  }
}

   #5 - Associar Subnet com a Route Table

  resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.produção-route-table.id
}

   #6 - Criar Security Group liberando as portas 22 (SSH), 80 (HTTP) e 443 (HTTPS)

   resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic"
  description = "Allow web inbound traffic"
  vpc_id      = aws_vpc.produção-vpc.id

  tags = {
    Name = "allow_web"
  }


ingress {
  description = "HTTPS"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

ingress {
  description = "HTTP"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

ingress {
  description = "SSH"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

 egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   }

   #7 - Criar Network Interface com ip na Subnet que foi criada no passo 4

  resource "aws_network_interface" "web-server-nic" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_web.id]

}

   #8 - Designar um IP elástico para Network Interface criada no passo 7

  resource "aws_eip" "one" {
  domain = "vpc"
  network_interface         = aws_network_interface.web-server-nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [ aws_internet_gateway.gw ]
}

   #9 - Criar Ubuntu Server a instalar/habilitar apache 2

 resource "aws_instance" "web-server-instance" {
  ami           = "ami-0427090fd1714168b"
  instance_type = "t2.micro"
  availability_zone = "us-east-1"
  key_name = "igor-key"

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.web-server-nic.id
  }

  user_data = <<-EOF
                 #!/bin/bash
                 sudo apt update -y
                 sudo apt install apache2 -y
                 sudo systemctl start apacher2
                 sudo bash cv 'echo your web server > /var/www/html/index.html'
                 EOF
                 
  tags = {
    Name = "web-server"
  }

 }



