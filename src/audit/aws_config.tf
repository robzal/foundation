module "aws_config" {
  source = "git@github.com:robzal/foundation_modules.git//src/modules/aws_config?ref=v1.1.0"

  audit_account_id                = "self"
  customer_prefix                 = var.customer_prefix
  central_audit_account_role_name = data.terraform_remote_state.main_account.outputs.audit_account_config_role_name
}
