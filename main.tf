terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket  = "terraform-cicd-project"
    key     = "terraform.tfstate"
    encrypt = true
    region  = "us-east-1"
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}