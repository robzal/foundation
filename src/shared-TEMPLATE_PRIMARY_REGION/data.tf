
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

## For VPC Peering
#data "terraform_remote_state" "prod_ap_southeast_2_account" {
#  backend = "s3"
#
#  config = {
#    bucket         = "${var.customer_prefix}-tfstate-ap-southeast-2"
#    key            = "workload-production-ap-southeast-2.tfstate"
#    region         = "ap-southeast-2"
#    dynamodb_table = "${var.customer_prefix}-tfstate-ap-southeast-2"
#    role_arn       = "arn:aws:iam::TEMPLATE_MAIN_ACCOUNT:role/terraform-cross-account-remote-state"
#  }
#}

# For VPC Flow Log bucket
data "terraform_remote_state" "audit_account" {
  backend = "s3"

  config = {
    bucket         = "${var.customer_prefix}-tfstate-ap-southeast-2"
    key            = "audit.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "${var.customer_prefix}-tfstate-ap-southeast-2"
    role_arn       = "arn:aws:iam::TEMPLATE_MAIN_ACCOUNT:role/terraform-cross-account-remote-state"
  }
}

# # For transit gateway resource access manager 
# data "terraform_remote_state" "main_account" {
#   backend = "s3"

#   config = {
#     bucket         = "${var.customer_prefix}-tfstate-ap-southeast-2"
#     key            = "main.tf"
#     region         = "ap-southeast-2"
#     dynamodb_table = "${var.customer_prefix}-tfstate-ap-southeast-2"
#     role_arn       = "arn:aws:iam::TEMPLATE_MAIN_ACCOUNT:role/terraform-cross-account-remote-state"
#   }
# }
# # For isolated tranist gateway route table
# data "terraform_remote_state" "dev_ap_southeast_2_account" {
#   backend = "s3"

#   config = {
#     bucket         = "${var.customer_prefix}-tfstate-ap-southeast-2"
#     key            = "workload-TEMPLATE_EXAMPLE_WORKLOAD_NAME-ap-southeast-2.tfstate"
#     region         = "ap-southeast-2"
#     dynamodb_table = "${var.customer_prefix}-tfstate-ap-southeast-2"
#     role_arn       = "arn:aws:iam::TEMPLATE_MAIN_ACCOUNT:role/terraform-cross-account-remote-state"
#   }
# }

