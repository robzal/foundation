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
      Environment = "workload-TEMPLATE_EXAMPLE_WORKLOAD_NAME-ap-southeast-2"
      Owner       = var.customer_prefix
      Project     = "Infrastructure"
      ManagedBy   = "Terraform"
    }
  }
}
