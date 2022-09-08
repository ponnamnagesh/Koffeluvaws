module "network" {
    source = "./modules/network"
    region = var.region
    project_name = var.project_name
}

module "security" {
    source = "./modules/security"
    vpc_id = module.network.vpc_id
    region           = var.region
    project_name     = var.project_name
}

module "compute" {
    source           = "./modules/compute"
    region           = var.region
    project_name     = var.project_name
    PublicSubnet_IDs = module.network.PublicSubnet_IDs
    AppSubnet_IDs    = module.network.AppSubnet_IDs
    key_name         = var.key_name
    BastionSG        = module.security.BastionSG
    AppSG            = module.security.AppSG
}
module "containers" {
    source          = "./modules/containers"
    key_name         = var.key_name
    //myLabKeyPair    = module.compute.myLabKeyPair
    EcsSG           = module.security.EcsSG
    //ecsInstanceProfileId = module.security.EcsInstanceProfileId
    ECSProfile       = module.security.ECSProfile
}
