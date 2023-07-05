terraform {
  required_version = "~> 1.5.1"
  backend "remote" {
    organization = "demo-land"
    workspaces {
      name = "aws-vpc"
    }
  }
}
