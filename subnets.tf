resource "aws_subnet" "publicA" {
 #count      = length(var.public_subnet_cidrs)
 vpc_id     = aws_vpc.main.id
 #cidr_block = element(var.public_subnet_cidrs, count.index)
  #type        = list(string)
 description = "Public Subnet CIDR values"
cidr_block   = "172.16.1.0/24"
 
 tags = {
   Name = "Public Subnet - publicA}"
 }
}
