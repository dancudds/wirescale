resource "aws_lb_target_group" "lbtg" {
  name     = "lbtg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}





resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.lbtg.arn
  target_id        = aws_instance.keycloak.id
}

resource "aws_lb" "lb" {
  name               = "wirescalelb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public.id, aws_subnet.private.id]
  security_groups    = [aws_security_group.allow_http.id, aws_security_group.allow_all_TLS.id]

  tags = {
    name = "wirescale"
  }
}
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_arm

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lbtg.arn
  }
}