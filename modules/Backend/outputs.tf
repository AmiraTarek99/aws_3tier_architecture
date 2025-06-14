output "be_alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.backend_alb.dns_name
}
output "be_alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.backend_alb.arn
}

output "be_lt_id" {
  description = "The ID of the launch template"
  value       = aws_launch_template.backend_lt.id
}

output "be_aws_lb_target_group_arn" {
  description = "The ARN of the BackEnd Application Load Balancer target group"
  value       = aws_lb_target_group.be-tg.arn
}