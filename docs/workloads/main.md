
# Main AWS Account
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.20.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_budget"></a> [aws\_account\_budget](#input\_aws\_account\_budget) | Amount to alert when the bill for the whole AWS Organization will exceed on current forecast or has exceeded. | `number` | `500` | no |
| <a name="input_aws_account_budget_notification_email_address"></a> [aws\_account\_budget\_notification\_email\_address](#input\_aws\_account\_budget\_notification\_email\_address) | Email address to alert when the bill for the whole AWS Organization will exceed on current forecast or has exceeded. | `list(string)` | n/a | yes |
| <a name="input_billing_contact"></a> [billing\_contact](#input\_billing\_contact) | Map with email address, phone number, name and title for accounts billing contact | `map(string)` | <pre>{<br>  "email": "",<br>  "name": "",<br>  "phone_number": "",<br>  "title": ""<br>}</pre> | no |
| <a name="input_customer_prefix"></a> [customer\_prefix](#input\_customer\_prefix) | Prefix for all resources with the customer name. Should be lower case characters starting with an alpha character and be consistent across the environment. Only `-` as a special character. | `string` | `"TEMPLATE_CUSTOMER_PREFIX"` | no |
| <a name="input_operations_contact"></a> [operations\_contact](#input\_operations\_contact) | Map with email address, phone number, name and title for accounts operations contact | `map(string)` | <pre>{<br>  "email": "",<br>  "name": "",<br>  "phone_number": "",<br>  "title": ""<br>}</pre> | no |
| <a name="input_primary_region"></a> [primary\_region](#input\_primary\_region) | Primary AWS Region to deploy resources into | `string` | `"ap-southeast-2"` | no |
| <a name="input_secondary_regions"></a> [secondary\_regions](#input\_secondary\_regions) | Regions to be enabled for use. Defaults to empty list. | `list(string)` | `[]` | no |
| <a name="input_security_contact"></a> [security\_contact](#input\_security\_contact) | Map with email address, phone number, name and title for accounts security contact | `map(string)` | <pre>{<br>  "email": "",<br>  "name": "",<br>  "phone_number": "",<br>  "title": ""<br>}</pre> | no |
## Outputs

| Name | Description | Value | Sensitive |
|------|-------------|-------|:---------:|
| <a name="output_accounts_map"></a> [accounts\_map](#output\_accounts\_map) | List of all accounts and a mapping from account name to AWS Account Id | <pre>{<br>  "Audit Account": "TEMPLATE_AUDIT_ACCOUNT",<br>  "TEMPLATE_EXAMPLE_WORKLOAD_ACCOUNT_NAME": "TEMPLATE_EXAMPLE_WORKLOAD_ACCOUNT",<br>  "Itoc Foundation Current Release Main Account": "TEMPLATE_MAIN_ACCOUNT",<br>  "Production Canada Central Account": "497498761281",<br>  "Production Sydney Account": "370691313961",<br>  "Shared Account": "TEMPLATE_SHARED_ACCOUNT"<br>}</pre> | no |
| <a name="output_all_account_ids"></a> [all\_account\_ids](#output\_all\_account\_ids) | List of all AWS Account Ids in this AWS Organisation | <pre>[<br>  "TEMPLATE_MAIN_ACCOUNT",<br>  "TEMPLATE_EXAMPLE_WORKLOAD_ACCOUNT",<br>  "370691313961",<br>  "497498761281",<br>  "TEMPLATE_AUDIT_ACCOUNT",<br>  "TEMPLATE_SHARED_ACCOUNT"<br>]</pre> | no |
| <a name="output_audit_account_config_role_arn"></a> [audit\_account\_config\_role\_arn](#output\_audit\_account\_config\_role\_arn) | IAM Role ARN of the AWS Config role in the Audit AWS Account. | `"arn:aws:iam::TEMPLATE_AUDIT_ACCOUNT:role/TEMPLATE_CUSTOMER_PREFIX-org-config-role"` | no |
| <a name="output_audit_account_config_role_name"></a> [audit\_account\_config\_role\_name](#output\_audit\_account\_config\_role\_name) | IAM Role name of the AWS Config role in the Audit AWS Account. | `"TEMPLATE_CUSTOMER_PREFIX-org-config-role"` | no |
| <a name="output_audit_account_id"></a> [audit\_account\_id](#output\_audit\_account\_id) | Audit account number | `"TEMPLATE_AUDIT_ACCOUNT"` | no |
| <a name="output_audit_account_org_admin_role_arn"></a> [audit\_account\_org\_admin\_role\_arn](#output\_audit\_account\_org\_admin\_role\_arn) | Audit account IAM org role | `"arn:aws:iam::TEMPLATE_AUDIT_ACCOUNT:role/AWSOrgAdmin"` | no |
| <a name="output_cross_account_remote_state_role_arn"></a> [cross\_account\_remote\_state\_role\_arn](#output\_cross\_account\_remote\_state\_role\_arn) | AWS IAM Role ARN for accessing the remote state from accounts other than the main account in this AWS Organisation. | `"arn:aws:iam::TEMPLATE_MAIN_ACCOUNT:role/terraform-cross-account-remote-state"` | no |
| <a name="output_TEMPLATE_EXAMPLE_WORKLOAD_NAME_account_id"></a> [TEMPLATE_EXAMPLE_WORKLOAD_NAME\_account\_id](#output\_TEMPLATE_EXAMPLE_WORKLOAD_NAME\_account\_id) | TEMPLATE_EXAMPLE_WORKLOAD_ACCOUNT_NAME number | `"TEMPLATE_EXAMPLE_WORKLOAD_ACCOUNT"` | no |
| <a name="output_TEMPLATE_EXAMPLE_WORKLOAD_NAME_account_org_admin_role_arn"></a> [TEMPLATE_EXAMPLE_WORKLOAD_NAME\_account\_org\_admin\_role\_arn](#output\_TEMPLATE_EXAMPLE_WORKLOAD_NAME\_account\_org\_admin\_role\_arn) | TEMPLATE_EXAMPLE_WORKLOAD_ACCOUNT_NAME IAM org role | `"arn:aws:iam::TEMPLATE_EXAMPLE_WORKLOAD_ACCOUNT:role/AWSOrgAdmin"` | no |
| <a name="output_infrastructure_account_ids"></a> [infrastructure\_account\_ids](#output\_infrastructure\_account\_ids) | Account IDs in Infrastructure OU | <pre>[<br>  "TEMPLATE_SHARED_ACCOUNT"<br>]</pre> | no |
| <a name="output_prod_canada_central_account_id"></a> [prod\_canada\_central\_account\_id](#output\_prod\_canada\_central\_account\_id) | Prod Canada Central account number | `"370691313961"` | no |
| <a name="output_prod_canada_central_account_org_admin_role_arn"></a> [prod\_canada\_central\_account\_org\_admin\_role\_arn](#output\_prod\_canada\_central\_account\_org\_admin\_role\_arn) | Prod Canada Central account IAM org role | `"arn:aws:iam::370691313961:role/AWSOrgAdmin"` | no |
| <a name="output_prod_sydney_account_id"></a> [prod\_sydney\_account\_id](#output\_prod\_sydney\_account\_id) | Prod Sydney account number | `"370691313961"` | no |
| <a name="output_prod_sydney_account_org_admin_role_arn"></a> [prod\_sydney\_account\_org\_admin\_role\_arn](#output\_prod\_sydney\_account\_org\_admin\_role\_arn) | Prod Sydney account IAM org role | `"arn:aws:iam::370691313961:role/AWSOrgAdmin"` | no |
| <a name="output_security_account_ids"></a> [security\_account\_ids](#output\_security\_account\_ids) | Account IDs in Security OU | <pre>[<br>  "TEMPLATE_AUDIT_ACCOUNT"<br>]</pre> | no |
| <a name="output_shared_account_id"></a> [shared\_account\_id](#output\_shared\_account\_id) | Shared account number | `"TEMPLATE_SHARED_ACCOUNT"` | no |
| <a name="output_shared_account_org_admin_role_arn"></a> [shared\_account\_org\_admin\_role\_arn](#output\_shared\_account\_org\_admin\_role\_arn) | Shared account IAM org role | `"arn:aws:iam::TEMPLATE_SHARED_ACCOUNT:role/AWSOrgAdmin"` | no |
| <a name="output_workload_account_ids"></a> [workload\_account\_ids](#output\_workload\_account\_ids) | Account IDs in Workload OU | <pre>[<br>  "497498761281",<br>  "370691313961",<br>  "TEMPLATE_EXAMPLE_WORKLOAD_ACCOUNT"<br>]</pre> | no |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.20.0 |
| <a name="provider_aws.audit"></a> [aws.audit](#provider\_aws.audit) | 4.20.0 |
| <a name="provider_aws.us-east-1"></a> [aws.us-east-1](#provider\_aws.us-east-1) | 4.20.0 |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_all"></a> [all](#module\_all) | git@github.com:robzal/foundation-modules.git//src/modules/all_accounts | latest |
| <a name="module_audit_account"></a> [audit\_account](#module\_audit\_account) | git@github.com:robzal/foundation-modules.git//src/modules/aws_account | latest |
| <a name="module_aws_config"></a> [aws\_config](#module\_aws\_config) | git@github.com:robzal/foundation-modules.git//src/modules/aws_config | latest |
| <a name="module_aws_organization"></a> [aws\_organization](#module\_aws\_organization) | git@github.com:robzal/foundation-modules.git//src/modules/aws_org | latest |
| <a name="module_backup_policy_ap_southeast_2"></a> [backup\_policy\_ap\_southeast\_2](#module\_backup\_policy\_ap\_southeast\_2) | git@github.com:robzal/foundation-modules.git//src/modules/aws_backup_policy | latest |
| <a name="module_budget_sns"></a> [budget\_sns](#module\_budget\_sns) | git@github.com:robzal/foundation-modules.git//src/modules/sns_email | latest |
| <a name="module_delete_default_vpcs"></a> [delete\_default\_vpcs](#module\_delete\_default\_vpcs) | git@github.com:robzal/foundation-modules.git//src/modules/delete_default_vpcs | latest |
| <a name="module_TEMPLATE_EXAMPLE_WORKLOAD_NAME_account"></a> [TEMPLATE_EXAMPLE_WORKLOAD_NAME\_account](#module\_TEMPLATE_EXAMPLE_WORKLOAD_NAME\_account) | git@github.com:robzal/foundation-modules.git//src/modules/aws_account | latest |
| <a name="module_global_org_guardduty"></a> [global\_org\_guardduty](#module\_global\_org\_guardduty) | git@github.com:robzal/foundation-modules.git//src/modules/global_org_guardduty | latest |
| <a name="module_global_remote_state"></a> [global\_remote\_state](#module\_global\_remote\_state) | git@github.com:robzal/foundation-modules.git//src/modules/global_remote_state | latest |
| <a name="module_itoc_access"></a> [itoc\_access](#module\_itoc\_access) | git@github.com:robzal/foundation-modules.git//src/modules/itoc_access | latest |
| <a name="module_org_change_alarm_sns"></a> [org\_change\_alarm\_sns](#module\_org\_change\_alarm\_sns) | git@github.com:robzal/foundation-modules.git//src/modules/sns_email | latest |
| <a name="module_prod_canada_central_account"></a> [prod\_canada\_central\_account](#module\_prod\_canada\_central\_account) | git@github.com:robzal/foundation-modules.git//src/modules/aws_account | latest |
| <a name="module_prod_sydney_account"></a> [prod\_sydney\_account](#module\_prod\_sydney\_account) | git@github.com:robzal/foundation-modules.git//src/modules/aws_account | latest |
| <a name="module_remote_state"></a> [remote\_state](#module\_remote\_state) | git@github.com:robzal/foundation-modules.git//src/modules/remote_state | latest |
| <a name="module_scps"></a> [scps](#module\_scps) | git@github.com:robzal/foundation-modules.git//src/modules/scps | latest |
| <a name="module_shared_account"></a> [shared\_account](#module\_shared\_account) | git@github.com:robzal/foundation-modules.git//src/modules/aws_account | latest |
| <a name="module_sso"></a> [sso](#module\_sso) | git@github.com:robzal/foundation-modules.git//src/modules/aws_sso | latest |
## Resources

| Name | Type |
|------|------|
| [aws_budgets_budget.all_accounts_budget](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/budgets_budget) | resource |
| [aws_cloudtrail.org_cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/cloudtrail) | resource |
| [aws_cloudwatch_log_group.cloudtrail_log_group](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_metric_filter.org_changes](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_metric_alarm.org_change_alarm](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_config_configuration_aggregator.organization](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/config_configuration_aggregator) | resource |
| [aws_cur_report_definition.cur_report_definition](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/cur_report_definition) | resource |
| [aws_iam_role.cloud_trail](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/iam_role) | resource |
| [aws_iam_role.org_config_role](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.cloudtrail_cloudwatch_policy](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.tfstate_policy](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.org_config_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_alias.cloudtrail_s3_cmk_alias](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/kms_alias) | resource |
| [aws_kms_key.cloudtrail_s3_cmk](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/kms_key) | resource |
| [aws_organizations_delegated_administrator.config](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/organizations_delegated_administrator) | resource |
| [aws_organizations_delegated_administrator.config_multiaccount](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/organizations_delegated_administrator) | resource |
| [aws_s3_bucket.cloudtrail_access_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.cloudtrail_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.cur_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.cur_bucket_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_securityhub_account.enable_main_account](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/securityhub_account) | resource |
| [aws_securityhub_organization_admin_account.audit_account_admin_delegate](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/securityhub_organization_admin_account) | resource |
| [aws_securityhub_organization_configuration.org_wide_sechub_config](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/securityhub_organization_configuration) | resource |
# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 12/04/2022
Initial Release

## [1.1.0] - 01/07/2022
Bug fixes and Access Analyzer added in the Foundation

