variable "ami" {
  type = string
}
variable "key_pair" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "be_sg" {
  type = string
}
# variable "backend_alb_dns" {
#   type = string
# }
variable "vpc_id" {
  type = string
}
variable "int_lb_sg" {
  type = string
}
variable "private_subnet" {
  type = list(string)
}
