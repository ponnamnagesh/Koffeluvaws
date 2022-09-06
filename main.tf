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
  
  #project_name     = var.project_name
  PublicSubnet_IDs = module.network.PublicSubnet_IDs
  AppSubnet_IDs    = module.network.AppSubnet_IDs
  key_name         = var.key_name
  BastionSG        = module.security.BastionSG
  AppSG            = module.security.AppSG
}