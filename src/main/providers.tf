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
  region = var.primary_region
  default_tags {
    tags = {
      Environment = "MainAccount"
      Owner       = var.customer_prefix
      Project     = "MainAWSAccount"
      ManagedBy   = "Terraform"
    }
  }
}


# us-east-1 provider needed for Cost and Usage Report
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "MainAccount"
      Owner       = var.customer_prefix
      Project     = "MainAWSAccount"
      ManagedBy   = "Terraform"
    }
  }
}
