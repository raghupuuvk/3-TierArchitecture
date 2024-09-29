resource "aws_instance" "V1PublicLinux" {
  ami = "ami-0bb84b8ffd87024d8"
  instance_type = var.instance_type

  user_data = file("${path.module}/webserverfile.sh")

  #vpc_security_group_ids = []
  subnet_id = aws_subnet.V1PublicSubnet_call.id
  vpc_security_group_ids = [ aws_security_group.SecurityGP_http_ssh.id ]

  key_name = "04May2024"

  tags = {
    Name = "V1PublicLinux"
  }
}

resource "aws_instance" "V1PrivateLinux" {
  ami = "ami-0bb84b8ffd87024d8"
  instance_type = var.instance_type

  user_data = file("${path.module}/webserverfile.sh")

  #vpc_security_group_ids = []
  subnet_id = aws_subnet.V1PrivateSubnet_call.id
  vpc_security_group_ids = [ aws_security_group.SecurityGP_http_ssh.id ]
  key_name = "04May2024"

  tags = {
    Name = "V1PrivateLinux"
  }
}

resource "aws_instance" "V2PrivateLinux" {
  ami = "ami-02bf8ce06a8ed6092"
  instance_type = var.instance_type
  provider = aws.use2

  #user_data = file("${path.module}/webserverfile.sh")

  #vpc_security_group_ids = []
  subnet_id = aws_subnet.V2PrivateSubnet_call.id
  vpc_security_group_ids = [ aws_security_group.SecurityGP_http_ssh2.id ]
  key_name = "19May2024"

  tags = {
    Name = "V2PrivateLinux"
  }

}

resource "aws_instance" "V2PublicLinux" {
  ami = "ami-02bf8ce06a8ed6092"
  instance_type = var.instance_type
  provider = aws.use2

  #user_data = file("${path.module}/webserverfile.sh")

  #vpc_security_group_ids = []
  subnet_id = aws_subnet.V2PublicSubnet_call.id
  vpc_security_group_ids = [ aws_security_group.SecurityGP_http_ssh2.id ]
  key_name = "19May2024"

  tags = {
    Name = "V2PublicLinux"
  }
}


