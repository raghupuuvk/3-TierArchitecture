/*resource "aws_lb" "ALB_call" {
  name               = "ALB1"
  internal           = false
  load_balancer_type = "application"
  #vpc_id = aws_vpc.vpc1_call.id
  security_groups    = [aws_security_group.SecurityGP_http_ssh.id]
  subnet_mapping {
    subnet_id = aws_subnet.V1PrivateSubnet_call.id
  }

  subnet_mapping {
    subnet_id = aws_subnet.V1PublicSubnet_call.id
  }

}


resource "aws_lb_target_group" "ALB_target_call" {
  name        = "TG1"
  target_type = "alb"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc1_call.id
}

resource "aws_lb_target_group_attachment" "target_1" {
  target_group_arn = aws_lb_target_group.ALB_target_call.arn
  target_id        = aws_instance.V1PrivateLinux.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "target_2" {
  target_group_arn = aws_lb_target_group.ALB_target_call.arn
  target_id        = aws_instance.V2PrivateLinux.id
  port             = 80
}

*/