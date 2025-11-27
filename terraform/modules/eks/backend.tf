terraform {
  required_version = "~> 1.12.1" # ensure this matches your environment
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }

  backend "s3" {
    bucket       = "chandra-terraform-eks-state-bucket"
    region       = "ap-south-1"
    key          = "eks/terraform.tfstate"
    use_lockfile = true # <--- enable native S3 locking
    encrypt      = true
  }
}


