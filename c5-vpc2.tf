resource "aws_vpc" "vpc2_call" {
  cidr_block       = "20.20.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "VPC2"
  }

  provider = aws.use2
}

resource "aws_subnet" "V2PublicSubnet_call" {
  vpc_id     = aws_vpc.vpc2_call.id
  cidr_block = "20.20.1.0/24"

  tags = {
    Name = "V2PublicSubnet"
  }
  map_public_ip_on_launch = true

  provider = aws.use2
}

resource "aws_subnet" "V2PrivateSubnet_call" {
  vpc_id     = aws_vpc.vpc2_call.id
  cidr_block = "20.20.2.0/24"

  tags = {
    Name = "V2PrivateSubnet"
  }

  provider = aws.use2
}

resource "aws_internet_gateway" "IGW2_call" {
  vpc_id = aws_vpc.vpc2_call.id

  tags = {
    Name = "IGW2"
  }
  provider = aws.use2
}

resource "aws_default_route_table" "MRT2_call" {
  default_route_table_id = aws_vpc.vpc2_call.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW2_call.id
  }

  tags = {
    Name = "MRT2"
  }

  provider = aws.use2
}


resource "aws_route_table" "CRT2_call" {
  vpc_id = aws_vpc.vpc2_call.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NGW2_call.id
  }

  route {
    cidr_block = aws_subnet.V1PrivateSubnet_call.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection_accepter.vpc1_vpc2_peering_acceptor_call.id
  }


  tags = {
    Name = "CRT2"
  }
  provider = aws.use2
}


resource "aws_route_table_association" "crt2_call_association" {
  subnet_id      = aws_subnet.V2PrivateSubnet_call.id
  route_table_id = aws_route_table.CRT2_call.id
  
  provider = aws.use2
}


resource "aws_route_table_association" "mrt2_call_association" {
  subnet_id      = aws_subnet.V2PublicSubnet_call.id
  route_table_id = aws_default_route_table.MRT2_call.id
  provider = aws.use2
}

resource "aws_eip" "eip2_call" {
  network_border_group = "us-east-2"
  provider = aws.use2
}

resource "aws_nat_gateway" "NGW2_call" {
  connectivity_type = "public"
  allocation_id = aws_eip.eip2_call.id
  subnet_id     = aws_subnet.V2PublicSubnet_call.id

  tags = {
    Name = "NGW2"
  }
  provider = aws.use2
}


