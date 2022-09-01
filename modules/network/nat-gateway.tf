# Allocate Elastic IP Address (EIP A)
# terraform aws allocate elastic ip
resource "aws_eip" "eip-for-nat-gateway-A" {
  vpc    = true

  tags   = {
    Name = "EIP A"
  }
}

# Allocate Elastic IP Address (EIP B)
# terraform aws allocate elastic ip
resource "aws_eip" "eip-for-nat-gateway-B" {
  vpc    = true

  tags   = {
    Name = "EIP B"
  }
}

# Allocate Elastic IP Address (EIP C)
# terraform aws allocate elastic ip
resource "aws_eip" "eip-for-nat-gateway-C" {
  vpc    = true

  tags   = {
    Name = "EIP C"
  }
}


# Create Nat Gateway A in Public Subnet A
# terraform create aws nat gateway
resource "aws_nat_gateway" "nat-gateway-A" {
  allocation_id = aws_eip.eip-for-nat-gateway-A.id
  subnet_id     = aws_subnet.publicA.id

  tags   = {
    Name = "NAT gateway public subnetA"
  }
}

# Create Nat Gateway B in Public Subnet B
# terraform create aws nat gateway
resource "aws_nat_gateway" "nat-gateway-B" {
  allocation_id = aws_eip.eip-for-nat-gateway-B.id
  subnet_id     = aws_subnet.publicB.id

  tags   = {
    Name = "NAT gateway public subnetB"
  }
}

# Create Nat Gateway C in Public Subnet C
# terraform create aws nat gateway
resource "aws_nat_gateway" "nat-gateway-C" {
  allocation_id = aws_eip.eip-for-nat-gateway-C.id
  subnet_id     = aws_subnet.publicC.id

  tags   = {
    Name = "NAT gateway public subnetC"
  }
}

# Create Private Route Table A and Add Route Through Nat Gateway A
# terraform aws create route table
resource "aws_route_table" "private-route-table-A" {
  vpc_id            = aws_vpc.main.id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat-gateway-A.id
  }

  tags   = {
    Name = "Private route table A"
  }
}

# Associate Private Subnet A with "Private Route Table A"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "private-subnet-1-route-table-association" {
  subnet_id         = aws_subnet.publicA.id
  route_table_id    = aws_route_table.private-route-table-A.id
}

# Associate Private Subnet 3 with "Private Route Table 1"
# terraform aws associate subnet with route table
#resource "aws_route_table_association" "private-subnet-3-route-table-association" {
 # subnet_id         = 
 # route_table_id    = 
#}

# Create Private Route Table B and Add Route Through Nat Gateway B
# terraform aws create route table
resource "aws_route_table" "private-route-table-B" {
  vpc_id            = aws_vpc.main.id

  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat-gateway-B.id
  }

  tags   = {
    Name = "Private route table B"
  }
}

# Associate Private Subnet B with "Private Route Table B"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "private-subnet-2-route-table-association" {
  subnet_id         = aws_subnet.publicB.id
  route_table_id    = aws_route_table.private-route-table-A.id
}

# Associate Private Subnet 4 with "Private Route Table 2"
# terraform aws associate subnet with route table
#resource "aws_route_table_association" "private-subnet-4-route-table-association" {
  #subnet_id         = 
  #route_table_id    =
#}
