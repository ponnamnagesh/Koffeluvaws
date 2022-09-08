provider "aws" {
    region          = var.region

}

module "network" {
    source          = "./network"
}

module "security" {
    source          = "./security"
    vpcId           = module.network.vpc_id
}

module "compute" {
    source          = "./compute"
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
    source          = "./containers"
    // ecsServiceRole  = module.security.ecsServiceRole
    myLabKeyPair    = module.compute.myLabKeyPair
    appA            = module.network.appA
    appB            = module.network.appB
    appC            = module.network.appC
    EcsSG           = module.security.EcsSG
    ecsInstanceProfileId = module.security.EcsInstanceProfileId
    // ecsExecutionRoleArn  = module.security.ecsExecutionRoleArn
    // KoffeeLuvTGArn  = module.network.KoffeeLuvTGArn
    // KoffeeLuvAlbName = module.network.KoffeeLuvAlbName
}

