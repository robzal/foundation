# Enabling Regions

By default Itoc Cloud Foundation is deployed into a primary region. To enable additional regions for workload accounts the following is recommended. 

## Enabling New Region
Add AWS Region Name to `/src/main/main.auto.tfvars` -> `secondary_regions` If you need to confirm the list of regions use `aws ec2 describe-regions --all-regions --query "Regions[].{Name:RegionName}" --output text`


