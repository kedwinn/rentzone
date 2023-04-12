# allocate elastic ip. this eip will be used for the nat-gateway in the public subnet az1 
resource "aws_eip" "eip1" {
  vpc = true
  tags = {
    Name = "${var.project_name}-${var.environment}-eip1"
  }
}

# allocate elastic ip. this eip will be used for the nat-gateway in the public subnet az2
resource "aws_eip" "eip2" {
  vpc = true

  tags = {
    Name = "${var.project_name}-${var.environment}-eip2"
  }
}

# create nat gateway in public subnet az1
resource "aws_nat_gateway" "natgwaz1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = var.Pubsubaz1_id

  tags = {
    Name = "${var.project_name}-${var.environment}-natgwaz1"
  }

  # to ensure proper ordering, it is recommended to add an explicit dependency
  # on the internet gateway for the vpc
  depends_on = [var.vpcigw]
}

# create nat gateway in public subnet az2
resource "aws_nat_gateway" "natgwaz2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = var.Pubsubaz2_id

  tags = {
    Name = "${var.project_name}-${var.environment}-natgwaz2"
  }

  # to ensure proper ordering, it is recommended to add an explicit dependency
  # on the internet gateway for the vpc
  depends_on = [var.vpcigw]
}

# create private route table az1 and add route through nat gateway az1
resource "aws_route_table" "PRT1" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgwaz1.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-PRT1"
  }
}


# associate private app subnet az1 with private route table az1
resource "aws_route_table_association" "PRTA1" {
  subnet_id      = var.Privappaz1_id
  route_table_id = aws_route_table.PRT1.id
}

# associate private data subnet az1 with private route table az1
resource "aws_route_table_association" "PRTA1" {
  subnet_id      = var.Privdbaz1_id
  route_table_id = aws_route_table.PRTA1.id
}

# create private route table az2 and add route through nat gateway az2
resource "aws_route_table" "PRTA2" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgwaz2.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-PRTA2"
  }
}

# associate private app subnet az2 with private route table az2
resource "aws_route_table_association" "private_app_subnet_az2_rt_az2_association" {
  subnet_id      =  var.Privappaz2_id
  route_table_id = aws_route_table.PRTA2.id
}

# associate private data subnet az2 with private route table az2
resource "aws_route_table_association" "private_data_subnet_az2_rt_az2_association" {
  subnet_id      = var.Privdbaz1_id
  route_table_id = aws_route_table.PRTA2.id
}