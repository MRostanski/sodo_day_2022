module "keys" {
  source = "../modules/keys"
}

output "keys" {
  value = module.keys.data
}