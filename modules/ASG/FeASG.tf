resource "aws_autoscaling_group" "Frontend_ASG" {
  name                      = "Frontend_ASG"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  vpc_zone_identifier       = [var.public_subnet[0],var.public_subnet[1]]
  target_group_arns         = [var.fe_aws_lb_target_group_arn]

  launch_template {
    id      = var.fe_lt
    version = "$Latest"
  }

  tag {
    key                 = "Nmae"
    value               = "frontend-instance"
    propagate_at_launch = true
  }

}

resource "aws_autoscaling_policy" "frontend_scale_out" {
  name                   = "frontend-scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.Frontend_ASG.name
}

resource "aws_autoscaling_policy" "frontend_scale_in" {
  name                   = "frontend-scale-in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.Frontend_ASG.name
}