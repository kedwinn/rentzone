# vpc variables
variable "region" {}
variable "project_name" {}
variable "environment" {}
variable "vpc_cidr" {}
variable "Pubsubaz1" {}
variable "Pubsubaz2" {}
variable "Privappsubaz1" {}
variable "Privappsubaz2" {}
variable "Privdbsubaz1" {}
variable "Privdbsubaz2" {}

#security groups varibales
variable "ssh_ip" {}

#rds variables
variable "database_snapshot_identifier" {}
variable "data_instance_class" {}
variable "database_instance_identifier" {}
variable "multi_az_deployment" {}

#acm variable
variable "domain_name" {}
variable "alternative_names" {}

#alb variable
variable "target_type" {}


#variables
Variable "env_file_name" {}
 variable "env_file_name" {}