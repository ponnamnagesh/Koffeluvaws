resource "aws_vpc" "main" {
 cidr_block = "172.16.0.0/16"
 enable_dns_hostnames = true
 region = "us-east-1"
 tags = {
   Name = "Project VPC"
 }
}
