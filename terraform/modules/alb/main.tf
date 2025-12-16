resource "aws_lb" "alb" {
  name               = "${var.app_name}_alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets = [var.public_1_id,var.public_2_id]

  
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name               = "${var.app_name}_tg"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

      health_check {
        interval            = 30
        path                = "/"
        protocol            = "HTTP"
        timeout             = 5
        healthy_threshold   = 5
        unhealthy_threshold = 2
        matcher = "HTTP"
    }
}


