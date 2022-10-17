module "dev" {
  source         = "./dev"
  admin_key_bits = var.dev_admin_key_bits
}

module "stage" {
  source         = "./stage"
  admin_key_bits = var.stage_admin_key_bits
  users = ["maciej", "mateusz"]
}

output "data" {
  value = {
    dev = module.dev.data
    stage = module.stage.data
  }
}