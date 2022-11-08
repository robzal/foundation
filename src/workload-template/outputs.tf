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

# output "tgw_attachment_id" {
#   description = "If there share_tgw is true, then create an attachment id that need to be accepted"
#   value       = module.vpc.tgw_wl_attachment_id
# }
# output "tgw_attachment_iso_id" {
#   description = "If there share_tgw and isoloated_rt_tbl is true, then create an attachment id that need to be accepted"
#   value       = module.vpc.tgw_iso_attachment_id
# }


# output "peering_connector_to_shared_ap_souteast_2_id" {
#  value       = aws_vpc_peering_connection.peer_to_shared_ap-southeast-2_AWS_SERVICES_vpc.id
#  description = "AWS VPC Peering connector to Shared ap-southeast-2 ID"
#}
