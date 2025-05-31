resource "aws_launch_template" "backend_lt" {
  name = "backendlt"
  image_id = var.ami
  instance_type = var.instance_type
  key_name = var.key_pair
  user_data = filebase64("${path.module}/userdata/backend-userdata.sh")

  network_interfaces {
    security_groups = [var.be_sg]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "backend"
    }
  }
}

resource "aws_lb_target_group" "be-tg" {
  name     = "be-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb" "backend_alb" {
  name               = "backendAlb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.int_lb_sg]
  subnets            = [var.private_subnet[0],var.private_subnet[1]]

}

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "3000"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.be-tg.arn
  }
}