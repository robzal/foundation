# New Workload Account

The design of AWS workload accounts is that there is a new AWS Account per environment per AWS region. An example of this is the production environment in ap-southeast-2 (Sydney) and ca-cental-1 (Canada). 
This would be two workload accounts and there by two AWS accounts, this structure is designed to help enable better isolation between regions and enable better auditability and security by ensuring there is nothing shared between the regions. 

# Steps do deploy a new workload account.

1. If this is the first time deploying to a new region you need to ensure that region is enabled based on [Enabling Regions](./enabling_regions.md).
2. Create new account in main account `/src/main/aws_accounts.tf`
```
module "workload_production_ca_central_1" {
  source                 = "../modules/aws_account"
  account_name           = "workload-{environment name}-{aws region name}"
  account_email          = "{unique email address for account}"
  parent_id              = module.aws_organization.workload_ou_id
  aws_region             = "us-east-1"

  grant_github_access    = true
  github_repository_path = "org/repo"

  enable_itoc_read_access             = true
  enable_itoc_write_access            = true
  enable_itoc_managed_services_access = true
}
```
3. Commit changes to a new branch and provider a Pull Request to check changes then merge to apply. Wait for apply to finish before continuing.
4. Duplicate workload template folder. `/src/workload-template` matching the `account_name` argument from the module above. 
3. Update `aws-details.json` in the new workload folder to update the account id in the role arn from `/docs/main.md` -> `Outputs` -> `accounts_map`
4. Duplicate github workflow `/.github/workflows/workload-*.yml` to be named after the `account_name` from the module
5. Update `workload_path` in the GitHub workflow file from the previous step
