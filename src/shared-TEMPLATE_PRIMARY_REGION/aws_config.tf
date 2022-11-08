module "aws_config" {
  source = "git@github.com:robzal/foundation-modules.git//src/modules/aws_config?ref=v1.1.0"

  audit_account_id = data.terraform_remote_state.audit_account.outputs.account_id
  customer_prefix  = var.customer_prefix
}
