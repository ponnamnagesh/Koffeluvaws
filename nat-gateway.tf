# Allocate Elastic IP Address (EIP 1)
# terraform aws allocate elastic ip
resource "aws_eip" "eip-for-nat-gateway-1" {
  vpc    = true

  tags   = {
    Name = "EIP 1"
  }
}

# Allocate Elastic IP Address (EIP 2)
# terraform aws allocate elastic ip
resource "aws_eip" "eip-for-nat-gateway-2" {
  vpc    = true

  tags   = {
    Name = "EIP 2"
  }
}

# Allocate Elastic IP Address (EIP 3)
# terraform aws allocate elastic ip
resource "aws_eip" "eip-for-nat-gateway-3" {
  vpc    = true

  tags   = {
    Name = "EIP 3"
  }
}


# Create Nat Gateway 1 in Public Subnet 1
# terraform create aws nat gateway
resource "aws_nat_gateway" "nat-gateway-1" {
  allocation_id = aws_eip.eip-for-nat-gateway-1.id
  subnet_id     = aws_subnet.publicA.id

  tags   = {
    Name = "NAT gateway public subnetA"
  }
}

# Create Nat Gateway 2 in Public Subnet 2
# terraform create aws nat gateway
resource "aws_nat_gateway" "nat-gateway-2" {
  allocation_id = aws_eip.eip-for-nat-gateway-2.id
  subnet_id     = aws_subnet.publicB.id

  tags   = {
    Name = "NAT gateway public subnetB"
  }
}

# Create Nat Gateway 3 in Public Subnet 3
# terraform create aws nat gateway
resource "aws_nat_gateway" "nat-gateway-3" {
  allocation_id = aws_eip.eip-for-nat-gateway-3.id
  subnet_id     = aws_subnet.publicC.id

  tags   = {
    Name = "NAT gateway public subnetC"
  }
}

# Create Private Route Table 1 and Add Route Through Nat Gateway 1
# terraform aws create route table
resource "aws_route_table" "private-route-table-1" {
  vpc_id            = 

  route {
    cidr_block      = 
    nat_gateway_id  = 
  }

  tags   = {
    Name = 
  }
}

# Associate Private Subnet 1 with "Private Route Table 1"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "private-subnet-1-route-table-association" {
  subnet_id         = 
  route_table_id    = 
}

# Associate Private Subnet 3 with "Private Route Table 1"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "private-subnet-3-route-table-association" {
  subnet_id         = 
  route_table_id    = 
}

# Create Private Route Table 2 and Add Route Through Nat Gateway 2
# terraform aws create route table
resource "aws_route_table" "private-route-table-2" {
  vpc_id            = 

  route {
    cidr_block      = 
    nat_gateway_id  = 
  }

  tags   = {
    Name =
  }
}

# Associate Private Subnet 2 with "Private Route Table 2"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "private-subnet-2-route-table-association" {
  subnet_id         = 
  route_table_id    = 
}

# Associate Private Subnet 4 with "Private Route Table 2"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "private-subnet-4-route-table-association" {
  subnet_id         = 
  route_table_id    =
}
