resource "aws_autoscaling_group" "Backend_ASG" {
  name                      = "backend-ASG"
  max_size                  = 3
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 1
  force_delete              = true
  vpc_zone_identifier       = [var.private_subnet[0],var.private_subnet[1]]
  target_group_arns         = [var.be_aws_lb_target_group_arn]

  launch_template {
    id      = var.be_lt
    version = "$Latest"
  }

  tag {
    key                 = "Nmae"
    value               = "backtend-instance"
    propagate_at_launch = true
  }

}

resource "aws_autoscaling_policy" "backend_scale_out" {
  name                   = "backend-scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.Backend_ASG.name
}

resource "aws_autoscaling_policy" "backend_scale_in" {
  name                   = "backend-scale-in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.Backend_ASG.name
}