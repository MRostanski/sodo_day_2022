variable "admin_key_bits" {
  type = number
  default = 2048
}

variable "user_key_bits" {
  type = number
  default = 2048
}

variable "users" {
  type = list(string)
  default = []
}