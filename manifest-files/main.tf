terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=5.0"
    }
  }
  backend "s3" {
    bucket = "tf-state-sadey2k"
    key    = "dev-tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  profile = "terraform-admin"
  region = "eu-west-2"
}