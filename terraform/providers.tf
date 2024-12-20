terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = ">= 5.72.0"
        }
    }
  required_version = ">= 1.5.0"
}

provider "aws" {
    region = "us-east-1"
}

provider "local" {
}