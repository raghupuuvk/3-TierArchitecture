resource "aws_security_group" "SecurityGP_http_ssh" {
  name        = "SecurityGP_http_ss"
  description = "Allow  inbound traffic and all outbound traffic"

  vpc_id = aws_vpc.vpc1_call.id

  tags = {
    Name = "SecurityGP_http_ss"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rule" {
  security_group_id = aws_security_group.SecurityGP_http_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


resource "aws_vpc_security_group_egress_rule" "egress_rule" {
  security_group_id = aws_security_group.SecurityGP_http_ssh.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



resource "aws_security_group" "SecurityGP_http_ssh2" {
  name        = "SecurityGP_http_ss2"
  description = "Allow  inbound traffic and all outbound traffic"

  vpc_id = aws_vpc.vpc2_call.id

  tags = {
    Name = "SecurityGP_http_ss2"
  }
  provider = aws.use2

}

resource "aws_vpc_security_group_ingress_rule" "ingress_rule2" {
  security_group_id = aws_security_group.SecurityGP_http_ssh2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
  provider = aws.use2
}


resource "aws_vpc_security_group_egress_rule" "egress_rule2" {
  security_group_id = aws_security_group.SecurityGP_http_ssh2.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  provider = aws.use2
}
