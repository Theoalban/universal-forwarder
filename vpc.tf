## vpc
resource "aws_vpc" "universal_forwarder-vpc" {
  cidr_block       = "10.11.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "uf-vpc"
    env  = "qa"
  }
}
## Subnet

resource "aws_subnet" "public_subnet10" {
  availability_zone       = "us-east-1a"
  vpc_id                  = aws_vpc.universal_forwarder-vpc.id
  cidr_block              = "10.11.5.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet10-public-vpc"
    env  = "qa"
  }
}

resource "aws_subnet" "public_subnet20" {
  availability_zone       = "us-east-1b"
  vpc_id                  = aws_vpc.universal_forwarder-vpc.id
  cidr_block              = "10.11.6.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet20-public-uf-vpc"
    env  = "qa"
  }
}
## Private subnet

resource "aws_subnet" "private_subnet10" {
  availability_zone = "us-east-1a"
  vpc_id            = aws_vpc.universal_forwarder-vpc.id
  cidr_block        = "10.11.7.0/24"
  tags = {
    Name = "subnet10-private-vpc"
    env  = "qa"
  }

}
resource "aws_subnet" "private_subnet20" {
  availability_zone = "us-east-1b"
  vpc_id            = aws_vpc.universal_forwarder-vpc.id
  cidr_block        = "10.11.8.0/24"
  tags = {
    Name = "subnet20-private-vpc"
    env  = "qa"
  }

}
## route table 
resource "aws_route_table" "rt10" {
  vpc_id = aws_vpc.universal_forwarder-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gtw10.id
  }
  #depends_on = [ aws_internet_gateway.gtw10 ]

}

## Gateway 
resource "aws_internet_gateway" "gtw10" {
  vpc_id = aws_vpc.universal_forwarder-vpc.id
  tags = {
    Name = "IGW2"
  }

}
##Route association

resource "aws_route_table_association" "rta10" {
  subnet_id      = aws_subnet.public_subnet10.id
  route_table_id = aws_route_table.rt10.id
}
resource "aws_route_table_association" "rta20" {
  subnet_id      = aws_subnet.public_subnet20.id
  route_table_id = aws_route_table.rt10.id
}