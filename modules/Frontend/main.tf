resource "aws_launch_template" "frontend_lt" {
  name = "frontendlt"
  image_id = var.ami
  instance_type = var.instance_type
  key_name = var.key_pair
    user_data = base64encode(templatefile("${path.module}/userdata/frontend-userdata.sh", {
    back_alb_dns = var.backend_alb_dns
  }))

  network_interfaces {
    security_groups = [var.fe_sg]
    associate_public_ip_address = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "frontend"
    }
  }
}

resource "aws_lb_target_group" "fe-tg" {
  name     = "fe-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb" "frontend_alb" {
  name               = "frontendAlb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.ex_lb_sg]
  subnets            = [var.public_subnet[0],var.public_subnet[1]]

}

resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.fe-tg.arn
  }
}