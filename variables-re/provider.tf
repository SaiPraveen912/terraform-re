terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
}

# provide authentication here
provider "aws" {
  # Configuration options should be here but github is not safe option
  # So we used aws configure in our local laptop
  region = "us-east-1"
}