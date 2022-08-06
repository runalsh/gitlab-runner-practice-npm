#===== variables =================

variable "region" {
  type    = string
}

variable "public_subnets" {
  default = ["10.0.3.0/24"]
}

variable "key_name_runner" {
  type    = string
}

variable "key_name2" {
  type    = string
}

variable "runnername" {
  type    = string
}


variable "runner_type" {
  type    = string
}

variable "alarms_email" {
  type    = string
}

# variable "telegramtoken" {
#   type      = string
#   sensitive = true
# }

variable "prefix" {
  type    = string
}
