terraform {
  backend "s3" {
    bucket         = "TEMPLATE_CUSTOMER_PREFIX-tfstate-ap-southeast-2"
    key            = "main.tf"
    region         = "ap-southeast-2"
    dynamodb_table = "TEMPLATE_CUSTOMER_PREFIX-tfstate-ap-southeast-2"
    role_arn       = "arn:aws:iam::TEMPLATE_MAIN_ACCOUNT:role/terraform-cross-account-remote-state"
  }
}
