output "fe_alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.frontend_alb.dns_name
}
output "fe_alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.frontend_alb.arn
}
output "fe_lt_id" {
  description = "The ID of the launch template"
  value       = aws_launch_template.frontend_lt.id
}

output "fe_aws_lb_target_group_arn" {
  description = "The ARN of the FrontEnd Application Load Balancer target group"
  value       = aws_lb_target_group.fe-tg.arn
}