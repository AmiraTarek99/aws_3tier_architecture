variable "private_subnet" {
  type = list(string)
}

variable "DB_pass" {
  type = string
}

variable "db_security_group_ids" {
  type = string
}