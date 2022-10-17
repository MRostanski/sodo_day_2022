variable "admin_key_bits" {
  type = number
  default = 2048
}

resource "tls_private_key" "admin_key" {
  algorithm = "RSA"
  rsa_bits = var.admin_key_bits
}

variable "user_key_bits" {
  type = number
  default = 2048
}

variable "users" {
  type    = list
  default = []
}

resource "tls_private_key" "user_key" {
  for_each = toset(var.users)
  algorithm = "RSA"
  rsa_bits = var.user_key_bits
}

output "data" {
  value = {
    admin = tls_private_key.admin_key.public_key_openssh
    user = { for user,key in tls_private_key.user_key :
      user =>  { type = "user"
      "key" = key.public_key_openssh
      }
    }
  }
}