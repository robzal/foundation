module "vpc" {
  source         = "git@github.com:robzal/foundation_modules.git//src/modules/vpc?ref=v1.1.0"
  naming_prefix  = "${var.customer_prefix}-TEMPLATE_EXAMPLE_WORKLOAD_NAME"
  network_prefix = "TEMPLATE_EXAMPLE_WORKLOAD_IP"
  number_of_ngws = 1

  flow_log_bucket_arn = data.terraform_remote_state.audit_account.outputs.central_flow_log_bucket_arn

  # #for tgw
  # share_tgw           = true
  # tgw_super_prefix    = "10.0.0.0/12"
  # isolated_tgw_rt_tbl = true
  # tgw_id              = data.terraform_remote_state.shared_account.outputs.tgw_id
  # ram_resource_share_arn = data.terraform_remote_state.shared_account.outputs.ram_resource_share_id
}

#resource "aws_vpc_peering_connection" "peer_to_shared_ap-southeast-2_AWS_SERVICES_vpc" {
#  peer_owner_id = data.terraform_remote_state.shared_ap-southeast-2_AWS_SERVICES_account.outputs.account_id
#  peer_vpc_id   = data.terraform_remote_state.shared_ap-southeast-2_AWS_SERVICES_account.outputs.vpc_id
#  vpc_id        = module.vpc.vpc_id
#}
#
#resource "aws_route" "private_vpc_peer_routes" {
#  for_each                  = toset(module.vpc.private_rt_ids)
#  route_table_id            = each.key
#  destination_cidr_block    = data.terraform_remote_state.shared_ap-southeast-2_AWS_SERVICES_account.outputs.vpc_cidr
#  vpc_peering_connection_id = aws_vpc_peering_connection.peer_to_shared_ap-southeast-2_AWS_SERVICES_vpc.id
#}
#
#resource "aws_route" "secure_vpc_peer_routes" {
#  for_each                  = toset(module.vpc.secure_rt_ids)
#  route_table_id            = each.key
#  destination_cidr_block    = data.terraform_remote_state.shared_ap-southeast-2_AWS_SERVICES_account.outputs.vpc_cidr
#  vpc_peering_connection_id = aws_vpc_peering_connection.peer_to_shared_ap-southeast-2_AWS_SERVICES_vpc.id
#}
#
