module "aws_organization" {
  source = "git@github.com:robzal/foundation_modules.git//src/modules/aws_org?ref=v1.1.0"
}

# https://www.trendmicro.com/cloudoneconformity/knowledge-base/aws/CloudWatchLogs/organizations-changes-alarm.html#E1Xhluwg
# Using Amazon CloudWatch alarms to detect administrator-specific changes such as create organization, delete organization,
# create new accounts within an organization or remove a member account from an organization is considered best practice and
# can help you prevent any unwanted, accidental or intentional modifications that may lead to unauthorized access or other security breaches.
resource "aws_cloudwatch_log_metric_filter" "org_changes" {
  name           = "${var.customer_prefix}-aws-org-change-filter"
  pattern        = "{ ($.eventSource = organizations.amazonaws.com) && ($.eventName = AcceptHandshake) || ($.eventName = AttachPolicy) || ($.eventName = CancelHandshake) || ($.eventName = CreateAccount) || ($.eventName = CreateOrganization) || ($.eventName = CreateOrganizationalUnit) || ($.eventName = CreatePolicy) || ($.eventName = DeclineHandshake) || ($.eventName = DeleteOrganization) || ($.eventName = DeleteOrganizationalUnit) || ($.eventName = DeletePolicy) || ($.eventName = EnableAllFeatures) || ($.eventName = EnablePolicyType) || ($.eventName = InviteAccountToOrganization) || ($.eventName = LeaveOrganization) || ($.eventName = DetachPolicy) || ($.eventName = DisablePolicyType) || ($.eventName = MoveAccount) || ($.eventName = RemoveAccountFromOrganization) || ($.eventName = UpdateOrganizationalUnit) || ($.eventName = UpdatePolicy) }"
  log_group_name = aws_cloudwatch_log_group.cloudtrail_log_group.name

  metric_transformation {
    name      = "OrganizationsEvents"
    namespace = "CloudTrailMetrics"
    value     = 1
  }
}

module "org_change_alarm_sns" {
  count  = var.security_contact["email"] == "" ? 0 : 1
  source = "git@github.com:robzal/foundation_modules.git//src/modules/sns_email?ref=v1.1.0"

  sns_topic_name  = "cw-alarm-org-change"
  email_addresses = [var.security_contact["email"]]
}

resource "aws_cloudwatch_metric_alarm" "org_change_alarm" {
  count             = var.security_contact["email"] == "" ? 0 : 1
  alarm_name        = "OrganizationsChangesAlarm"
  alarm_description = "Triggered by AWS Organizations events."

  metric_name     = "OrganizationsEvents"
  namespace       = "CloudTrailMetrics"
  actions_enabled = true
  alarm_actions   = [module.org_change_alarm_sns[0].sns_topic_arn]

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  period              = 300
  statistic           = "Sum"
  threshold           = 1
}
