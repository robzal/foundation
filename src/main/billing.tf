resource "aws_budgets_budget" "all_accounts_budget" {
  name         = "AWS Budget"
  limit_amount = var.aws_account_budget

  budget_type       = "COST"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2020-07-01_00:00"
  cost_types {
    include_credit             = false
    include_discount           = true
    include_other_subscription = true
    include_recurring          = true
    include_refund             = false
    include_subscription       = true
    include_support            = true
    include_tax                = true
    include_upfront            = true
    use_amortized              = false
    use_blended                = false
  }

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = 100
    threshold_type            = "PERCENTAGE"
    notification_type         = "ACTUAL"
    subscriber_sns_topic_arns = [module.budget_sns.sns_topic_arn]
  }

  notification {
    comparison_operator       = "GREATER_THAN"
    threshold                 = 100
    threshold_type            = "PERCENTAGE"
    notification_type         = "FORECASTED"
    subscriber_sns_topic_arns = [module.budget_sns.sns_topic_arn]
  }
}

module "budget_sns" {
  source = "git@github.com:robzal/foundation_modules.git//src/modules/sns_email?ref=v1.1.0"

  sns_topic_name  = "aws-budget"
  email_addresses = var.aws_account_budget_notification_email_address
}
