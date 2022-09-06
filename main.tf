module "network" {
  source    = "./modules/network"
  namespace = var.namespace
  region = var.region
}

