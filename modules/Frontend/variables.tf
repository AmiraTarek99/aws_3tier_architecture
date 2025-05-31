variable "ami" {
  type = string
}
variable "key_pair" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "fe_sg" {
  type = string
}
variable "backend_alb_dns" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "ex_lb_sg" {
  type = string
}
variable "public_subnet" {
  type = list(string)
}
