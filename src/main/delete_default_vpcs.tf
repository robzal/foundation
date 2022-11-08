module "delete_default_vpcs" {
  source              = "git@github.com:robzal/foundation_modules.git//src/modules/delete_default_vpcs?ref=v1.1.0"
  org_admin_role_name = "AWSOrgAdmin" # Default for aws_account module
}
