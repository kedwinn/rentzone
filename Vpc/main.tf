locals {
  region = var.region
  project_name = var.project_name
  environment = var.environment
}

# create vpc module
module "Vpc" {
  source = "git@github.com:kedwinn/rentzone.git//Vpc"
  region = local.region
  project_name = local.project_name
  environment = local.environment
  vpc_cidr = var.vpc_cidr
  Pubsubaz1 = var.Pubsubaz1
  Pubsubaz2 = var.Pubsubaz2
  Privappsubaz1 = var.Privappsubaz1
  Privappsubaz2 = var.Privappsubaz2
  Privdbsubaz1 = var.Privdbsubaz1
  Privdbsubaz2 = var.Privdbsubaz2
}

#create natgateway 
module "Natgateway_vpc"{
  source = "git@github.com:kedwinn/rentzone.git//Natgateway_vpc"
  project_name = local.project_name
  environment = local.environment
  Pubsubaz1 = module.vpc.Pubsubaz1_id
  Pubsubaz2 = module.vpc.Pubsubaz2_id
  vpcigw = module.vpc.vpcigw
  vpc_id = module.vpc.vpc_id
  Privappsubaz1_id = module.vpc.Privappsubaz1_id
  Privappsubaz2_id = module.vpc.Privappaz2_id
  rivdbsubaz1_id = module.vpc.Privdbsubaz1_id
  Privdbsubaz2_id = module.vpc.Privdbsubaz2_id
}

#create security group
module "Securitygroup_vpc" {
  source =  "git@github.com.kedwinn/rentzone.git//Securitygroup_vpc"
  project_name = local.project_name
  environment = local.environment
  vpc_id = module.vpc.vpc_id
  ssh_ip = var.ssh_ip
}

# Launch RDS instance
module "RDS" {
   source = "git@github.com.kedwinn/rentzone.git//RDS"
   project_name = local.project_name
   environment = local.environment
   Privdbsubaz1 = module.vpc.Privdbsubaz1_id
   Privdbsubaz2 = module.vpc.Privdbsubaz2_id
   database_snapshot_identifier = var.database_snapshot_identifier
   database_instance_class = var.database_instance_class
   availability_zone_1 = module.vpc.availability_zone_1
   database-instance_identifier = var.database_instance_identifier
   multi_az_deployment = var.multi_az-deploymeent
   database-security_group_id = module.Securitygroup_vpc.database_security_group_id
}

#Request ssl certiicate
module "ssl_certificate"{
   source = "git@github.com.kedwinn/rentzone.git//ACM"
   domain_name = var.domain_name
   alternative_names = var.alternative_names
}

#create application load balancer
module "application_load balancer" {
  source = "git@github.com.kedwinn/rentzone.git//ALB"
  project_name = local.project_name
  environment = local.environment
  alb_security_group_id = module.security_group.alb_security_group_id
  Pubsubaz1 = module.vpc.Pubsubaz1_id
  Pubsubaz2 = module.vpc.Pubsubaz2_id
  target_type = var.target_type
  vpc_id = module.vpc.vpc_id
  certificate_arn = module.ssl_certificate.certificate_arn
}

#create S3 bucket
module "S3" {
  source = "git@github.com.kedwinn/rentzone.git//S3"
  project_name = local.porject_name
  env_file_name = var.env_file_name
  env_file_bucket_name = var.env_file_bucket_name
}

# create ecs task execution role
module "ecs_task_execution_role" {
  source = "git@github.com.kedwinn/rentzone.git//iam_role"
  project_name = local.project_name
  environment = local.environment
  env_file_bucket_name = module.s3_bucket.env_file_bucket_name
}