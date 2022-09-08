provider "aws" {
    region          = var.region

}

module "network" {
    source          = "./modules/network"
}

module "security" {
    source          = "./modules/security"
    vpcId           = module.network.vpc_id
}

module "compute" {
    source          = "./modules/compute"
    publicSubnetA   = module.network.publicSubnetA
    publicSubnetB   = module.network.publicSubnetB
    publicSubnetC   = module.network.publicSubnetC
    appA            = module.network.appA
    appB            = module.network.appB
    appC            = module.network.appC
    BastionSG       = module.security.BastionSG
    AppSG           = module.security.AppSG
}

module "containers" {
    source          = "./modules/containers"
    // ecsServiceRole  = module.security.ecsServiceRole
    //myLabKeyPair    = module.compute.myLabKeyPair
    appA            = module.network.appA
    appB            = module.network.appB
    appC            = module.network.appC
    EcsSG           = module.security.EcsSG
    ecsInstanceProfileId = module.security.EcsInstanceProfileId
    //key_name         = var.key_name
    // ecsExecutionRoleArn  = module.security.ecsExecutionRoleArn
    // KoffeeLuvTGArn  = module.network.KoffeeLuvTGArn
    // KoffeeLuvAlbName = module.network.KoffeeLuvAlbName
}

