resource "aws_vpc_peering_connection" "vpc1_vpc2_peering_requestor_call" {
  vpc_id        = aws_vpc.vpc1_call.id
  peer_vpc_id   = aws_vpc.vpc2_call.id
  peer_region   = "us-east-2"
  auto_accept   = false

  tags = {
    Name = "vpc1_vpc2_peering_requestor"
  }
}

resource "aws_vpc_peering_connection_accepter" "vpc1_vpc2_peering_acceptor_call" {
  provider                  = aws.use2
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_vpc2_peering_requestor_call.id
  auto_accept               = true

  tags = {
    Side = "vpc1_vpc2_peering_acceptor"
  }
}