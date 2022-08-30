resource "aws_subnet" "publicAs" {
vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.1.0/24"
availability_zone      = "us-east-2a"
 
 tags = {
   Name = "Public Subnet - publicA"
 }
}

resource "aws_subnet" "publicB" {
vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.2.0/24"
availability_zone      = "us-east-2b"
 
 tags = {
   Name = "Public Subnet - publicB"
 }
}

resource "aws_subnet" "publicC" {
vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.3.0/24"
availability_zone      = "us-east-2c"
 
 tags = {
   Name = "Public Subnet - publicC"
 }
}
