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

resource "tls_private_key" "admin_key" {
  algorithm = "RSA"
  rsa_bits = var.admin_key_bits
}

resource "tls_private_key" "user_key" {
  for_each = toset(var.users)
  algorithm = "RSA"
  rsa_bits = var.user_key_bits
}

output "data" {
  value = { 
    users = merge(
    { admin = { 
        type = "admin" 
        key = tls_private_key.admin_key.public_key_openssh
      }
    },
    { for user in toset(var.users) : 
      user => {
        type = "user"
        key = tls_private_key.user_key[user].public_key_openssh
      }
    }
    )
  }
}