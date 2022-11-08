
# Production (ap-southeast-2)
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
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | Account Id for this account | `"370691313961"` | no |
| <a name="output_iam_role_ec2_lambda_scheduler_role"></a> [iam\_role\_ec2\_lambda\_scheduler\_role](#output\_iam\_role\_ec2\_lambda\_scheduler\_role) | The role used by the Ec2 lambda Scheduler to start/stop instances | <pre>{<br>  "arn": "arn:aws:iam::370691313961:role/Ec2-lambda-scheduler",<br>  "assume_role_policy": "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":[\"arn:aws:iam::TEMPLATE_SHARED_ACCOUNT:role/ec2-instance-scheduler-start-scheduler-lambda\",\"arn:aws:iam::TEMPLATE_SHARED_ACCOUNT:role/ec2-instance-scheduler-stop-scheduler-lambda\"]},\"Action\":\"sts:AssumeRole\"}]}",<br>  "create_date": "2022-02-11T07:37:25Z",<br>  "description": "Allows Lambda functions from shared account to stop and start ec2 and rds resources",<br>  "force_detach_policies": false,<br>  "id": "Ec2-lambda-scheduler",<br>  "inline_policy": [<br>    {<br>      "name": "ec2-custom-policy-scheduler",<br>      "policy": "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Sid\": \"\",\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"ec2:StopInstances\",\n        \"ec2:StartInstances\",\n        \"ec2:ModifyInstanceAttribute\",\n        \"ec2:DescribeRegions\",\n        \"ec2:DescribeInstances\"\n      ],\n      \"Resource\": \"arn:aws:ec2:ap-southeast-2:370691313961:instance/*\"\n    },\n    {\n      \"Sid\": \"\",\n      \"Effect\": \"Allow\",\n      \"Action\": [\n        \"tag:GetResources\",\n        \"ssm:DescribeMaintenanceWindows\",\n        \"ssm:DescribeMaintenanceWindowExecutions\",\n        \"autoscaling:DescribeAutoScalingInstances\"\n      ],\n      \"Resource\": \"*\"\n    }\n  ]\n}"<br>    }<br>  ],<br>  "managed_policy_arns": [],<br>  "max_session_duration": 3600,<br>  "name": "Ec2-lambda-scheduler",<br>  "name_prefix": "",<br>  "path": "/",<br>  "permissions_boundary": null,<br>  "tags": {},<br>  "tags_all": {<br>    "Environment": "workload-production-ap-southeast-2",<br>    "ManagedBy": "Terraform",<br>    "Owner": "worxdesign",<br>    "Project": "Infrastructure"<br>  },<br>  "unique_id": "AROAVMTXMSEU5CHKWXRDB"<br>}</pre> | no |
| <a name="output_region"></a> [region](#output\_region) | Region name for this account | `"ap-southeast-2"` | no |
| <a name="output_tgw_attachment_id"></a> [tgw\_attachment\_id](#output\_tgw\_attachment\_id) | If there share\_tgw is true, then create an attachment id that need to be accepted | `"tgw-attach-004e07c147d557b26"` | no |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | VPC CIDR for this account | `"10.10.0.0/16"` | no |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | AWS VPC ID for this account | `"vpc-0c42c25c72aba80b2"` | no |
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
| <a name="module_vpc"></a> [vpc](#module\_vpc) | git@github.com:robzal/foundation-modules.git//src/modules/vpc | latest |
## Resources

| Name | Type |
|------|------|
| [aws_iam_role.ec2_lambda_scheduler_role](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.ec2_lambda_scheduler_access](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/resources/iam_role_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.ec2_lambda_scheduler_access_cross_permissions](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ec2_lambda_scheduler_cross_assume](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/4.20.0/docs/data-sources/region) | data source |
| [terraform_remote_state.audit_account](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.main_account](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.shared_account](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 12/04/2022
Initial Release

## [1.1.0] - 01/07/2022
Bug fixes and Access Analyzer added in the Foundation

