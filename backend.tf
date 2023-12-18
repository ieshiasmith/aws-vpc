terraform {
  required_version = "~> 1.5.2"
  backend "remote" {
    organization = "HashIeshia"
    workspaces {
      name = "aws-vpc"
    }
  }
}
