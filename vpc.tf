resource "aws_vpc" "main" {
 cidr_block = "172.16.0.0/16"
 availability_zone      = "us-east-1"
 tags = {
   Name = "Project VPC"
 }
}
