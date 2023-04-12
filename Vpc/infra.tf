#create vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = true 
  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

#Create and internet gateway
resource "aws_internet_gateway" "vpcigw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.project_name}-${var.environment}-igw"
  }
}

#use data source to get all availability zone
data "aws_availability_zones" "availability_zones"{}

#create public subnet az1
resource "aws_subnet" "Pubsubaz1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_pubsubaz1
  availability_zone = data.aws_availability_zones.availability_zones[0]
  map_public_ip_on_launch = true
    tags = {
    Name = "${var.project_name}-${var.environment}-Pubsubaz1"
  }
}

#create public subnet az2
resource "aws_subnet" "Pubsubaz2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_pubsubaz2
  availability_zone = data.aws_availability_zones.availability_zones[1]
  map_public_ip_on_launch = true
    tags = {
    Name = "${var.project_name}-${var.environment}-Pubsubaz2"
  }
}


#create private app subnet az1
resource "aws_subnet" "Privappsubaz1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_privappsubaz1
  availability_zone = data.aws_availability_zones.availability_zones[0]
  map_public_ip_on_launch = true
    tags = {
    Name = "${var.project_name}-${var.environment}-Privappsubaz1"
  }
}

#create private app subnet az2
resource "aws_subnet" "Privappsubaz2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_privappsubaz2
  availability_zone = data.aws_availability_zones.availability_zones[0]
  map_public_ip_on_launch = false
    tags = {
    Name = "${var.project_name}-${var.environment}-Privappsubaz2"
  }
}

#create private db subnet az1
resource "aws_subnet" "Privdbsubaz1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_privdbsubaz1
  availability_zone = data.aws_availability_zones.availability_zones[0]
  map_public_ip_on_launch = false
    tags = {
    Name = "${var.project_name}-${var.environment}-Privdbsubaz1"
  }
}

#create private db subnet az1
resource "aws_subnet" "Privdbsubaz2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_privdbsubaz2
  availability_zone = data.aws_availability_zones.availability_zones[1]
  map_public_ip_on_launch = false
    tags = {
    Name = "${var.project_name}-${var.environment}-Privdbsubaz2"
  }
}

# create route table and add public route
resource "aws_route_table" "PRT1" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpcigw.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-PRT1"
  }
}
# associate public subnet az1 to "public route table"
resource "aws_route_table_association" "public_subnet_az1_rt_association" {
  subnet_id      = var.Pubsubaz1_id
  route_table_id = aws_route_table.PRT1.id
}

# associate public subnet az2 to "public route table"
resource "aws_route_table_association" "public_subnet_2_rt_association" {
   subnet_id      = var.Pubsubaz2_id
  route_table_id = aws_route_table.PRT1.id
}
 
