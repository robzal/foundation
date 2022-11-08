
output "region" {
  value       = data.aws_region.current.name
  description = "Region name for this account"
}

output "account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "Account Id for this account"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "AWS VPC ID for this account"
}

output "vpc_cidr" {
  value       = module.vpc.vpc_cidr
  description = "VPC CIDR for this account"
}

# ## TGW Outputs
# output "tgw_id" {
#   description = "If variable `create_tgw` if true then Transit Gateway Id else empty string."
#   value       = module.vpc.tgw_id
# }

# #aws_ram_resource_share
# output "ram_resource_share_id" {
#   description = "If variable `create_tgw` if true then The Amazon Resource Name (ARN) of the resource share"
#   value       = module.vpc.ram_resource_share_id
# }

# # aws_ram_principal_association
# output "ram_principal_association_id" {
#   description = "If variable `create_tgw` if true then The Amazon Resource Name (ARN) of the Resource Share and the principal, separated by a comma"
#   value       = module.vpc.ram_principal_association_id
# }

# # aws_tgw_attachment_id
# output "tgw_attachment_id" {
#   description = "If there share_tgw is true, then create an attachment id that need to be accepted"
#   value       = module.vpc.tgw_shared_attachment_id
# }
