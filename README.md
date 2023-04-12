## Deploying a Dynamic website rentzone on AWS

💻 Setting Up Your Local Environment 
####✅ Installing and Setting Up Terraform
####✅ Creating a Free GitHub Account for Your Project
####✅ Installing Git on Your Computer
###✅ Generating Key Pairs for Secure Connections
###✅ Adding Public SSH Key to GitHub
###✅ Installing Visual Studio Code
###✅ Installing Terraform Extensions
###✅ Installing the AWS Command Line

🌩️ AWS Configuration and Terraform State Management
✅ Creating an IAM User in AWS
✅ Generating an Access Key for an IAM User
✅ Running the AWS Configure Command
✅ Creating an S3 Bucket for Storing Terraform State
✅ Creating a DynamoDB Table to Lock Terraform State

🛠️ Building AWS Infrastructure with Terraform Modules
✅ Create and Clone Git Repo for Terraform Modules
✅ Developing a Terraform Module for VPC
#### Workflow ####
Provision a vpc with 2pub, 2app and 2DB subnets in 2 spreaded across AZ's. Create an Igw, attach vpc to Igw.
Create 2 routetables: pub/priv,  attach pub/priv subnets to route tables.
create 3 routetable assoociations for Pub, App and DB
Create 2 eip and 2 Natgateways in Pubsubs
Create 2 Natroutes, associate App/DB subs and route to App/DBsub
create 4 SG's: SSH-22 open to DB/APP, app-servers open to port 80/443/22, ALB to listening on port 80/443, DB 22/3306 open to APP and bastionhost 
Create MySQL instance
Register the domain, create your route 53 in a hostedzone 
Created a MYSL instance to log queries
Create an S3 bucket, Ec2 role to store our App code
Provisioned AMI role to store config code and configure SNS to receive notfication, SSL for data in transit 
✅ Create and Clone Git Repository for the Infrastructure
✅ Setting Up a Terraform Provider
✅ Configuring a Terraform Backend
✅ Building a 3-Tier VPC from Scratch
✅ Developing a Terraform Module for NAT Gateway
✅ Creating a NAT Gateway for Your VPC
✅ Developing a Terraform Module for Security Groups
✅ Creating Security Groups for Your VPC
✅ Developing a Terraform Module for RDS
✅ Creating an RDS Instance for Your Database
✅ Developing a Terraform Module for ACM
✅ Setting Up SSL Certificates for Your AWS Resources
✅ Developing a Terraform Module for Application Load Balancer
✅ Creating a Load Balancer for Your Application
✅ Developing a Terraform Module for S3 Bucket
✅ Creating an S3 Bucket for Your Application
✅ Developing a Terraform Module for Task Execution Role
✅ Creating a Task Execution Role for Your ECS Tasks
✅ Creating a Terraform Module for ECS Cluster, Task Definition, and Service
✅ Creating an ECS Cluster, Task Definition, and Service
✅ Developing a Terraform Module for ECS Auto Scaling Group
✅ Creating an ECS Auto Scaling Group for Your Application
✅ Developing a Terraform Module for Route-53
✅ Creating Route 53 DNS Records for Your Application
