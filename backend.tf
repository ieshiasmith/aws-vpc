terraform {
  required_version = "~> 1.3.9"
  backend "remote" {
    organization = "demo-land"
    workspaces {
      name = "aws-vpc"
    }
  }
}
