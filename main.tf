module "network" {
    source = "./modules/network"
    region = var.region
    project_name = var.project_name
}

module "security" {
    source = "./modules/security"
    vpc_id = module.modules.network.vpc_id
    region           = var.region
    project_name     = var.project_name
}

module "compute" {
    source           = "./modules/compute"
    region           = var.region
    project_name     = var.project_name
    PublicSubnet_IDs = module.modules.network.PublicSubnet_IDs
    AppSubnet_IDs    = module.modules.network.AppSubnet_IDs
    key_name         = var.key_name
    BastionSG        = module.modules.security.BastionSG
    AppSG            = module.modules.security.AppSG
}
