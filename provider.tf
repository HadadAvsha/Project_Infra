provider "aws" {
  region = "us-west-2"
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.31.0"
    }
  }
  backend "s3" {
    region = "us-east-2"
    bucket = "avsha-tf-state"
    key    = "tfstate"
  }
}