
# Shared (ap-southeast-2)
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.20.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_customer_prefix"></a> [customer\_prefix](#input\_customer\_prefix) | Prefix for all resources with the customer name. Should be lower case characters starting with an alpha character and be consistent across the environment. Only `-` as a special character. | `string` | n/a | yes |
## Outputs

| Name | Description | Value | Sensitive |
|------|-------------|-------|:---------:|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | Account Id for this account | `"TEMPLATE_SHARED_ACCOUNT"` | no |
| <a name="output_ec2_lambda_iam_start_arn"></a> [ec2\_lambda\_iam\_start\_arn](#output\_ec2\_lambda\_iam\_start\_arn) | The ARN role for the lambda function for start | `"arn:aws:iam::TEMPLATE_SHARED_ACCOUNT:role/ec2-instance-scheduler-start-scheduler-lambda"` | no |
| <a name="output_ec2_lambda_iam_stop_arn"></a> [ec2\_lambda\_iam\_stop\_arn](#output\_ec2\_lambda\_iam\_stop\_arn) | The ARN role for the lambda function for stop | `"arn:aws:iam::TEMPLATE_SHARED_ACCOUNT:role/ec2-instance-scheduler-stop-scheduler-lambda"` | no |
| <a name="output_ec2_lambda_scheduler_start_arn"></a> [ec2\_lambda\_scheduler\_start\_arn](#output\_ec2\_lambda\_scheduler\_start\_arn) | The ARN of the Lambda function for start | `"arn:aws:lambda:ap-southeast-2:TEMPLATE_SHARED_ACCOUNT:function:ec2-instance-scheduler-start"` | no |
| <a name="output_ec2_lambda_scheduler_stop_arn"></a> [ec2\_lambda\_scheduler\_stop\_arn](#output\_ec2\_lambda\_scheduler\_stop\_arn) | The ARN of the Lambda function for stop | `"arn:aws:lambda:ap-southeast-2:TEMPLATE_SHARED_ACCOUNT:function:ec2-instance-scheduler-stop"` | no |
| <a name="output_ram_principal_association_id"></a> [ram\_principal\_association\_id](#output\_ram\_principal\_association\_id) | If variable `create_tgw` if true then The Amazon Resource Name (ARN) of the Resource Share and the principal, separated by a comma | `"arn:aws:ram:ap-southeast-2:TEMPLATE_SHARED_ACCOUNT:resource-share/24cafb41-5f64-41d5-a3d8-221a8da1da16,497498761281"` | no |
| <a name="output_ram_resource_share_id"></a> [ram\_resource\_share\_id](#output\_ram\_resource\_share\_id) | If variable `create_tgw` if true then The Amazon Resource Name (ARN) of the resource share | `"arn:aws:ram:ap-southeast-2:TEMPLATE_SHARED_ACCOUNT:resource-share/24cafb41-5f64-41d5-a3d8-221a8da1da16"` | no |
| <a name="output_region"></a> [region](#output\_region) | Region name for this account | `"ap-southeast-2"` | no |
| <a name="output_tgw_attachment_id"></a> [tgw\_attachment\_id](#output\_tgw\_attachment\_id) | If there share\_tgw is true, then create an attachment id that need to be accepted | `"tgw-attach-076d9bc21a256bd16"` | no |
| <a name="output_tgw_id"></a> [tgw\_id](#output\_tgw\_id) | If variable `create_tgw` if true then Transit Gateway Id else empty string. | `"tgw-0b40fceb5d22273c4"` | no |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | VPC CIDR for this account | `"10.0.0.0/16"` | no |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | AWS VPC ID for this account | `"vpc-0e498a1b035773537"` | no |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.20.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_all"></a> [all](#module\_all) | git@github.com:robzal/foundation-modules.git//src/modules/all_accounts | latest |
| <a name="module_aws_backup_org_member"></a> [aws\_backup\_org\_member](#module\_aws\_backup\_org\_member) | git@github.com:robzal/foundation-modules.git//src/modules/aws_backup_member | latest |
| <a name="module_aws_config"></a> [aws\_config](#module\_aws\_config) | git@github.com:robzal/foundation-modules.git//src/modules/aws_config | latest |
| <a name="module_start_ec2_instance"></a> [start\_ec2\_instance](#module\_start\_ec2\_instance) | diodonfrost/lambda-scheduler-stop-start/aws | 3.1.3 |
| <a name="module_stop_ec2_instance"></a> [stop\_ec2\_instance](#module\_stop\_ec2\_instance) | diodonfrost/lambda-scheduler-stop-start/aws | 3.1.3 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git@github.com:robzal/foundation-modules.git//src/modules/vpc | latest |
## Resources

| Name | Type |
|------|------|
| [aws_iam_role_policy.cross_assume_ec2_scheduler_start](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.cross_assume_ec2_scheduler_stop](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/iam_role_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.cross_assume_ec2_instance_scheduler](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/data-sources/region) | data source |
| [terraform_remote_state.audit_account](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.dev_ap-southeast-2_AWS_SERVICES_account](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.main_account](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 12/04/2022
Initial Release

## [1.1.0] - 01/07/2022
Bug fixes and Access Analyzer added in the Foundation

