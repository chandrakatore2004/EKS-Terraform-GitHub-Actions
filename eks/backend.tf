terraform {
  required_version = "~> 1.12.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "s3" {
    bucket         = "chandra-terraform-eks-state-s3-bucket"
    region         = "ap-south-1"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
}

provider "aws" {
  region  = var.aws-region
}
