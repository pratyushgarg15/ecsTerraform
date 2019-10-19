resource "aws_lb" "pratyushALB" {
  name               = "pratyushLT"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.aws_subnet_public

  tags = {
    Name = "pratyushALB"
  }
}

resource "aws_lb_target_group" "pratyushTG" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc-id
  tags = {
    Name = "patTG"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.pratyushALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pratyushTG.arn
  }
}