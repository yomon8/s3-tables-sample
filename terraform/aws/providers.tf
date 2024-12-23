terraform {
  required_version = ">= v1.10.1"
  required_providers {
    aws = {
      version = "= 5.81.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    key = "s3-tables-sample/aws.tfstate"
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile

  default_tags {
    tags = {
      GithubOrg  = "yomon8"
      GithubRepo = "s3-tables-sample"
    }
  }
}
