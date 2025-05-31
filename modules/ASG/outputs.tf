

output "fe_autoscaling_group_names" {
  description = "The names of the autoscaling groups"
  value       = aws_autoscaling_group.Frontend_ASG.name
}
output "fe_scale_out_arns" {
  description = "The Scale Out ARNS"
  value       = aws_autoscaling_policy.frontend_scale_out.arn
}
output "fe_scale_in_arns" {
  description = "The Scale in ARNS"
  value       = aws_autoscaling_policy.frontend_scale_in.arn
}
output "be_autoscaling_group_names" {
  description = "The names of the autoscaling groups"
  value       = aws_autoscaling_group.Backend_ASG.name
}
output "be_scale_out_arns" {
  description = "The Scale Out ARNS"
  value       = aws_autoscaling_policy.backend_scale_out.arn
}
output "be_scale_in_arns" {
  description = "The Scale in ARNS"
  value       = aws_autoscaling_policy.backend_scale_in.arn
}
