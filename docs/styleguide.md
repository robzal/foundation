# Itoc Terraform Styleguide
## Terraform Format
Run `terraform fmt --recursive` at the top level before each commit to ensure code is formatted correctly.
More info on this is available [here](https://www.terraform.io/cli/commands/fmt).

Unfortunately due to a limitation of the tflint tool it doesn't have a great explanation of how a file has failed linting.
This manifests as the command exiting with code 3 and spitting out a file name that needs to be formatted.

## No main.tf
All Terraform files should be named after their purpose

## All workspace and modules should have variables.tf and outputs.tf
This is to help provide default structure to all workspaces and modules

## Pinned providers
Help prevent things breaking

## providers.tf (not versions)

## Editorconfig

# Naming Conventions

## AWS Resources
* Hyphen case
* Naming convention of custprefix-workload-region-whatever

## Terraform resources
* Snake case
