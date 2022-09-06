module "network" {
  source    = "./modules/network"
  namespace = var.namespace
  region = var.region
}

module "compute" {
  source    = "./modules/compute"
  namespace = var.namespace
  region = var.region
}

module "security" {
  source    = "./modules/security"
  namespace = var.namespace
  region = var.region
}