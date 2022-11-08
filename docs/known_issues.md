## access denied on aws sso
If AWS SSO isn't enabled then SSO terraform says access denied

## Error: error creating aggregator: SubscriptionRequiredException: The AWS Access Key Id needs a subscription for the service
New accounts take a while to initialize, a 5min sleep is built into account creation, however this isn't always enough. Just run Terraform again.

## Error: error creating EBS encryption by default (true): OptInRequired: You are not subscribed to this service. Please go to http://aws.amazon.com to subscribe.
May rarely happen on account creation module call. Assume the ItocAdmin role - you'll be prompted to select a version of support (select free) and hit continue. It make take an hour or so for this to fully apply to the account.

## Error: error enabling GuardDuty Organization Admin Account (ACCOUNT NUMBER): BadRequestException: The request is rejected because service linked role cannot be created for AWS Organization management account.
This sometimes happens on org wide setup for GuardDuty, just try again.
