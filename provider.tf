provider "aws" {
  region  = var.region
  profile = "Brenda"

  default "tags" {
    tags = {
      "Automation"  = "terrafomr"
      "Project"     = var / project_name
      "Environment" = var.environment
    }
  }
}