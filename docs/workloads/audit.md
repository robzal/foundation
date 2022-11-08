
# Audit Account
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.20.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_customer_prefix"></a> [customer\_prefix](#input\_customer\_prefix) | Prefix for all resources with the customer name. Should be lower case characters starting with an alpha character and be consistent across the environment. Only `-` as a special character. | `string` | `"worxdesign"` | no |
| <a name="input_security_notification_emails"></a> [security\_notification\_emails](#input\_security\_notification\_emails) | List of email addresses to email security issues to. | `list(string)` | n/a | yes |
## Outputs

| Name | Description | Value | Sensitive |
|------|-------------|-------|:---------:|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | Account Id for this account | `"TEMPLATE_AUDIT_ACCOUNT"` | no |
| <a name="output_central_flow_log_bucket_arn"></a> [central\_flow\_log\_bucket\_arn](#output\_central\_flow\_log\_bucket\_arn) | ARN of central flow log bucket | `"arn:aws:s3:::worxdesign-central-flow-logs"` | no |
| <a name="output_region"></a> [region](#output\_region) | Region name for this account | `"ap-southeast-2"` | no |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.20.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_all"></a> [all](#module\_all) | git@github.com:robzal/foundation-modules.git//src/modules/all_accounts | latest |
| <a name="module_aws_config"></a> [aws\_config](#module\_aws\_config) | git@github.com:robzal/foundation-modules.git//src/modules/aws_config | latest |
| <a name="module_security_notifications"></a> [security\_notifications](#module\_security\_notifications) | git@github.com:robzal/foundation-modules.git//src/modules/security_notifications | latest |
| <a name="module_security_sns_emails"></a> [security\_sns\_emails](#module\_security\_sns\_emails) | git@github.com:robzal/foundation-modules.git//src/modules/sns_email | latest |
## Resources

| Name | Type |
|------|------|
| [aws_accessanalyzer_analyzer.org_analyzer](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/accessanalyzer_analyzer) | resource |
| [aws_s3_bucket.flow_logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.flow_logs_bucket_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/data-sources/region) | data source |
| [terraform_remote_state.main_account](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 12/04/2022
Initial Release

## [1.1.0] - 01/07/2022
Bug fixes and Access Analyzer added in the Foundation


