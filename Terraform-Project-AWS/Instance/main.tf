terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
   
} 

data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "<YOUR-BUCKET-S3>"
    key    = "networking/terraform.tfstate"
    region = "us-east-1"
  }
}


provider "aws" {
  region = var.assume_role.region

  default_tags {
    tags = var.tags
  }

  assume_role {
    role_arn = var.assume_role.arn
  }
}
