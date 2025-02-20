resource "aws_security_group" "sg_for_alb_eks_marcel" {
  name        = "marcel-sg-for-alb-eks"
  description = "LoadBalancer Security Group"

  vpc_id      = aws_vpc.vpc_us_east_2_marcel_01.id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic by default"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "alb_eks_marcel" {
  name               = "alb-eks-marcel"
  load_balancer_type = "application"
  internal           = false
  subnets            = [
    aws_subnet.subnet_public_us_east_2a_marcel_01.id,
    aws_subnet.subnet_public_us_east_2b_marcel_01.id
  ]
  security_groups    = [aws_security_group.sg_for_alb_eks_marcel.id]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb_eks_marcel.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "OK"
      status_code  = "200"
    }
  }
}