terraform {
  backend "s3" {
    bucket         = "bucket75"
    key            = "terraform-module/renzone/terraform.tfstate"
    region         = "eu-west-2"
    profile        = "Brenda"
    dynamodb_table = "terraform-state-lock"
  }
}