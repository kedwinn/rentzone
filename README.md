## Deploying a Dynamic website rentzone on AWS

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
Provisioned AMI role to store config code and configure SNS to receive notfication, SSL for dat in transit 