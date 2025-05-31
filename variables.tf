variable "cidr" {
  type = string
  #   default     = "10.5.0.0/16"
  description = "this is cidr block for vpc"
}


# variable "instance-type" {
#   type = string
# }

# variable "sub-pub-cidr" {
#   type = list
# }

variable "azs56" {
  type = list
}

# variable "sub-priv-cidr" {
#   type = list
# }


variable "region" {
  type = string
}

variable "db_pass" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami" {
  type = string
  
}
variable "autoscaling_group_names" {
  type = list(string)
}

variable "scale_out_arns" {
  type = list(string)
}

variable "scale_in_arns" {
  type = list(string)
}

