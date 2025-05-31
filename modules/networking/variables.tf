variable "cidr" {
  type = string
    default     = "10.0.0.0/16"
  description = "this is cidr block for vpc"
}


# variable "pub-sub" {
#   type = list
# }

variable "azs" {
  type = list
}

# variable "priv-sub" {
#   type = list
# }