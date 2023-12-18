terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Owner       = "Ieshia Smith"
      Purpose     = "ieshialand"
      Terraform   = true
      Environment = "development"
      DoNotDelete = true
      Name        = "IESHIALAND VPC"
    }
  }

}
