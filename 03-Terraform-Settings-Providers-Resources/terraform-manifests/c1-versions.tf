terraform {
  required_version = "~> 1.5.6" // this means any version above x.x.6 is allowed to use (only minor version)
  required_providers {
    //https://registry.terraform.io/providers/hashicorp/aws/latest/docs
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}