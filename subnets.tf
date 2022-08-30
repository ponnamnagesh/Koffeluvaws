resource "aws_subnet" "publicA" {
 vpc_id     = aws_vpc.main.id
cidr_block   = "172.16.1.0/24"
 availability_zones      = "us-east-1a"
 
 tags = {
   Name = "Public Subnet - publicA"
 }
}


