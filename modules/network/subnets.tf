resource "aws_subnet" "publicA" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_blocks[0]
  availability_zone = var.azs[0]
  map_public_ip_on_launch = true
  
  tags = {
    Name = "public_subnetA"
  }
}

resource "aws_subnet" "publicB" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_blocks[1]
  availability_zone = var.azs[1]
  map_public_ip_on_launch = true
  
  tags = {
    Name = "public_subnetB"
  }
}

resource "aws_subnet" "publicC" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_blocks[2]
  availability_zone = var.azs[2]
  map_public_ip_on_launch = true
  
  tags = {
    Name = "public-subnetC"
  }
}

resource "aws_subnet" "appA" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_blocks[0]
  availability_zone = var.azs[0]
  
  tags = {
    Name = "private-AppA"
  }
}

resource "aws_subnet" "appB" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_blocks[1]
  availability_zone = var.azs[1]
  
  tags = {
    Name = "private-AppB"
  }
}

resource "aws_subnet" "appC" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_blocks[2]
  availability_zone = var.azs[2]
  
  tags = {
    Name = "private-AppC"
  }
}

resource "aws_subnet" "DbA" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr_blocks[0]
  availability_zone = var.azs[0]
  
  tags = {
    Name = "private-DbA"
  }
}

resource "aws_subnet" "DbB" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr_blocks[1]
  availability_zone = var.azs[1]
  
  tags = {
    Name = "private-DbB"
  }
}

resource "aws_subnet" "DbC" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.database_subnet_cidr_blocks[2]
  availability_zone = var.azs[2]
  
  tags = {
    Name = "private-DbC"
  }
}
