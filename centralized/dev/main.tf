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

resource "tls_private_key" "user_key" {
  algorithm = "RSA"
  rsa_bits = var.user_key_bits
}

output "data" {
  value = {
    admin = tls_private_key.admin_key.public_key_openssh
    user = { 
      type = "user"
      key = tls_private_key.user_key.public_key_openssh
    }
  }
}