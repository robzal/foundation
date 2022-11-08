module "vpc" {
  source         = "git@github.com:robzal/foundation-modules.git//src/modules/vpc?ref=v1.1.0"
  naming_prefix  = "${var.customer_prefix}-shared"
  network_prefix = "10.0"
  number_of_ngws = 1

  flow_log_bucket_arn = data.terraform_remote_state.audit_account.outputs.central_flow_log_bucket_arn

  # # for tgw
  # create_tgw          = true
  # share_tgw           = true
  # isolated_tgw_rt_tbl = true
  # tgw_super_prefix    = "10.0.0.0/12"

  # isolated_attach_id    = data.terraform_remote_state.dev_ap-southeast-2_AWS_SERVICES_account.outputs.tgw_attachment_iso_id
  # ram_invite_principals = data.terraform_remote_state.main_account.outputs.workload_account_ids
}

#resource "aws_vpc_peering_connection_accepter" "workload_production_ap-southeast-2_AWS_SERVICES_peer" {
#  vpc_peering_connection_id = data.terraform_remote_state.prod_ap-southeast-2_AWS_SERVICES_account.outputs.peering_connector_to_shared_ap_souteast_2_id
#  auto_accept               = true
#}
#
#resource "aws_route" "route_to_workload_production_ap-southeast-2_AWS_SERVICES_private" {
#  for_each                  = toset(module.vpc.private_rt_ids)
#  route_table_id            = each.key
#  destination_cidr_block    = data.terraform_remote_state.prod_ap-southeast-2_AWS_SERVICES_account.outputs.vpc_cidr
#  vpc_peering_connection_id = data.terraform_remote_state.prod_ap-southeast-2_AWS_SERVICES_account.outputs.peering_connector_to_shared_ap_souteast_2_id
#
#  depends_on = [
#    aws_vpc_peering_connection_accepter.workload_production_ap-southeast-2_AWS_SERVICES_peer
#  ]
#}
#
#resource "aws_route" "route_to_workload_production_ap-southeast-2_AWS_SERVICES_secure" {
#  for_each                  = toset(module.vpc.secure_rt_ids)
#  route_table_id            = each.key
#  destination_cidr_block    = data.terraform_remote_state.prod_ap-southeast-2_AWS_SERVICES_account.outputs.vpc_cidr
#  vpc_peering_connection_id = data.terraform_remote_state.prod_ap-southeast-2_AWS_SERVICES_account.outputs.peering_connector_to_shared_ap_souteast_2_id
#
#  depends_on = [
#    aws_vpc_peering_connection_accepter.workload_production_ap-southeast-2_AWS_SERVICES_peer
#  ]
#}
#
