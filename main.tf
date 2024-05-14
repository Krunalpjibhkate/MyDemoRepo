#VPC


resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.tenancy

  tags = {
    "Name" = "VPC-${var.namespace}"
  }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pub_sub[0]

  tags = {
    "Name" = "Public_Subnet-${var.namespace}"
  }
}

#resource "aws_subnet" "public2" {
#  vpc_id     = aws_vpc.main.id
#  cidr_block = var.pub_sub[1]

#  tags = {
#    "Name" = "Public_Subnet-${var.namespace}"
#  }
#}
#resource "aws_subnet" "public3" {
#  vpc_id     = aws_vpc.main.id
#  cidr_block = var.pub_sub[2]

#  tags = {
#    "Name" = "Public_Subnet-${var.namespace}"
#  }
#}


#resource "aws_subnet" "private1" {
#  vpc_id     = aws_vpc.main.id
#  cidr_block = var.priv_sub[0]

#  tags = {
#    "Name" = "Private_Subnet-${var.namespace}"
#  }
#}
#resource "aws_subnet" "private2" {
#  vpc_id     = aws_vpc.main.id
#  cidr_block = var.priv_sub[1]

#  tags = {
#    "Name" = "Private_Subnet-${var.namespace}"
#  }
#}
#resource "aws_subnet" "private3" {
#  vpc_id     = aws_vpc.main.id
#  cidr_block = var.priv_sub[2]

#  tags = {
#    "Name" = "Private_Subnet-${var.namespace}"
#  }
# }

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "IGW-${var.namespace}"
  }
}


resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    "Name" = "RT-${var.namespace}"
  }
}
