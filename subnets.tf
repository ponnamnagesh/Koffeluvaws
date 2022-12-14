resource "aws_subnet" "publicAs" {
vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.1.0/24"
availability_zone      = "us-east-1a"
 
 tags = {
   Name = "Public Subnet - publicA"
 }
}

resource "aws_subnet" "publicB" {
vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.2.0/24"
availability_zone      = "us-east-1b"
 
 tags = {
   Name = "Public Subnet - publicB"
 }
}

resource "aws_subnet" "publicC" {
vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.3.0/24"
availability_zone      = "us-east-1c"
 
 tags = {
   Name = "Public Subnet - publicC"
 }
}

#Private subnets

resource "aws_subnet" "privateAppA" {
vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.4.0/24"
availability_zone      = "us-east-1a"
 
 tags = {
   Name = "Private subnet - AppA"
 }
}

resource "aws_subnet" "privateAppB" {
vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.5.0/24"
availability_zone      = "us-east-1b"
 
 tags = {
   Name = "Private subnet - AppB"
 }
}

resource "aws_subnet" "privateAppC" {
vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.6.0/24"
availability_zone      = "us-east-1c"
 
 tags = {
   Name = "Private subnet - AppC"
 }
}

# Private Subnet DB

resource "aws_subnet" "privateDbA" {
vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.8.0/24"
availability_zone      = "us-east-1a"
 
 tags = {
   Name = "Private subnet - DbA"
 }
}

resource "aws_subnet" "privateDbB" {
vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.9.0/24"
availability_zone      = "us-east-1b"
 
 tags = {
   Name = "Private subnet - DbB"
 }
}

resource "aws_subnet" "privateDbC" {
vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.10.0/24"
availability_zone      = "us-east-1c"
 
 tags = {
   Name = "Private subnet - DbC"
 }
}
