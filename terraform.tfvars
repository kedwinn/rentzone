#vpc variables
region        = "eu-west-2"
project_name  = "rentzone"
environment   = "dev"
vpc_cidr      = "10.0.0.0/16"
Pubsubaz1     = "10.0.1.0/24"
Pubsubaz2     = "10.0.2.0/24"
Privappsubaz1 = "10.0.3.0/24"
Privappsubaz2 = "10.0.4.0/24"
Privdbsubaz1  = "10.0.5.0/24"
Privdbsubaz2  = "10.0.6.0/24"

#security groups variables
ssh_ip = ""

# rds variables
database_snapshot_identifier = "rentzone-ecs-final-snapshot"
data_instance_class          = "db.t2.micro"
database_instance_identifier = "dev-rds-db"
multi_az_deployment          = "false"

# acm variables
domain_name        = "tradecentre.co.uk"
alternatives_names = "*.tradeentre.co.uk"

#alb variable
target_type = "ip"

# s3 variable
env_file_bucket_name = "aosnote-ecs-env-file-bucket"
env_file_name ="rentzone.env"