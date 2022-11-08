terraform {
  backend "s3" {
    bucket         = "worxdesign-tfstate-ap-southeast-2"
    key            = "main.tf"
    region         = "ap-southeast-2"
    dynamodb_table = "worxdesign-tfstate-ap-southeast-2"
    role_arn       = "arn:aws:iam::329571102651:role/terraform-cross-account-remote-state"
  }
}
