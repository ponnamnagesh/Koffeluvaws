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
    
    key_name         = var.key_name
    BastionSG        = module.security.BastionSG
    
   
    
}

module "containers" {
    source = "./modules/containers"
    //region = var.region
    project_name = var.project_name
    ECSProfile       = module.security.ECSProfile
    ECSSG            = module.security.ECSSG
    ALBSG            = module.security.ALBSG
    key_name         = var.key_name
    AppSubnet_IDs    = module.network.AppSubnet_IDs
    PublicSubnet_IDs = module.network.PublicSubnet_IDs
    ecsTaskExecutionRolearn = module.security.ecsTaskExecutionRolearn
    vpc_id = module.network.vpc_id
    
}
        
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      //version = "3.67.0"
    }
      
  }
}


provider "aws" {
  region  = var.region  
}


