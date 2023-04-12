output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}

output "environment" {
  value = var.environment
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "availability_zone_1" {
  value = data.aws_availability_zones.availability_zones.names[0]
}

output "availability_zone_2" {
  value = data.aws_availability_zones.availability_zones.names[1]
}

output "vpcigw" {
  value = aws_internet_gateway.vpcigw.id
}

output "Pubsubaz1_id" {
  value = aws_subnet.Pubsubaz1.id
}

output "Pubsubaz2_id" {
  value = aws_subnet.Pubsubaz2.id
}

output "Privappsubaz1_id" {
  value = aws_subnet.Privapsubaz1.id
}

output "Privappsubaz2_id" {
  value = aws_subnet.Privappsubaz2.id
}

output "Privdbsubaz1_id" {
  value = aws_subnet.Privdbsubaz1.id
}

output "Privdbsubaz2_id" {
  value = aws_subnet.Privdbsubaz2.id
}
