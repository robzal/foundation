module "remote_state" {
  source                   = "git@github.com:robzal/foundation_modules.git//src/modules/remote_state?ref=v1.1.0"
  customer_prefix          = var.customer_prefix
  is_primary_region        = true
  organisation_account_ids = module.aws_organization.all_account_ids
}

module "global_remote_state" {
  source                             = "git@github.com:robzal/foundation_modules.git//src/modules/global_remote_state?ref=v1.1.0"
  cross_account_remote_state_role_id = module.remote_state.cross_account_remote_state_role_id
  customer_prefix                    = var.customer_prefix
  regions_to_enable                  = var.secondary_regions
}
