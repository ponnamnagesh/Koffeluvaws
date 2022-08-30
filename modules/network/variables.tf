variable "namespace" {
   type = string
}

variable "region" {
   type = string
}

variable "vpc_cidr_block" {
   type = string
   default = "172.16.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "Available cidr blocks for public subnets"
  type        = list(string)
  default = [
     "172.16.1.0/24",
     "172.16.2.0/24",
     "172.16.3.0/24",
  ]
}


variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets"
  type        = list(string)
  default = [
     "172.16.4.0/24",
     "172.16.5.0/24",
     "172.16.6.0/24"
  ]
}


variable "database_subnet_cidr_blocks" {
  description = "Available cidr blocks for database subnets"
  type        = list(string)
  default = [
     "172.16.7.0/24",
     "172.16.8.0/24",
     "172.16.9.0/24"
  ]
}


variable "azs" {
   type = list(string)
   default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "az_tag" {
   type = list(string)
   default = [
      "PublicA",
      "publicB",
      "publicC",
      "AppA",
      "AppB",
      "AppC",
      "DbA",
      "DbB",
      "DbC"
   ]
}
