terraform {
  required_version = ">= 1.2.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.20.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Environment = "audit"
      Owner       = var.customer_prefix
      Project     = "Infrastructure"
      ManagedBy   = "Terraform"
    }
  }
}
