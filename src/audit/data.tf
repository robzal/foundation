data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "terraform_remote_state" "main_account" {
  backend = "s3"

  config = {
    bucket         = "${var.customer_prefix}-tfstate-ap-southeast-2"
    key            = "main.tf"
    region         = "ap-southeast-2"
    dynamodb_table = "${var.customer_prefix}-tfstate-ap-southeast-2"
    role_arn       = "arn:aws:iam::TEMPLATE_MAIN_ACCOUNT:role/terraform-cross-account-remote-state"
  }
}
