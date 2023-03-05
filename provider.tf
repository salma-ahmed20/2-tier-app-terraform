terraform {
  required_providers {
   aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  # Adding terraform.tfstate file to s3 bucket
  backend "s3" {
    bucket = "salma-bucket"
    key    = "tfstate-terraform"
    region = "eu-central-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}
