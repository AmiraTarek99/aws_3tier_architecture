variable "fe_lt" {
  type = string
}
variable "public_subnet" {
  type = list
}
variable "fe_aws_lb_target_group_arn" {
  type = string
}
variable "be_lt" {
  type = string
}
variable "be_aws_lb_target_group_arn" {
  type = string
}
variable "private_subnet" {
  type = list
}