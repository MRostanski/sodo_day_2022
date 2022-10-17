module "keys" {
  source = "../modules/keys"
  users = var.users
}

resource "random_pet" "nicknames" {
  for_each = module.keys.data["users"]
  length = 2
}

output "keys" {
  value = module.keys.data
}

output "nicknames" {
  value = {
    for key, pet in random_pet.nicknames : 
      key => pet.id
  }
}