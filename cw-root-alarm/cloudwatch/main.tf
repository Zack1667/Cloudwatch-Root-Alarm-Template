provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

resource "aws_cloudwatch_log_group" "cloudtrail_log_group" {
  name = var.log_group_name
}

resource "aws_cloudwatch_log_metric_filter" "root_account_activity" {
  name           = "root-account-activity-filter"
  log_group_name = aws_cloudwatch_log_group.cloudtrail_log_group.name
  pattern        = "{ $.userIdentity.type = \"Root\" && $.userIdentity.invokedBy NOT EXISTS }"

  metric_transformation {
    name      = "RootAccountActivity"
    namespace = "CloudTrailMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "root_account_alarm" {
  alarm_name          = "RootAccountUsageAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = aws_cloudwatch_log_metric_filter.root_account_activity.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.root_account_activity.metric_transformation[0].namespace
  period              = 300
  statistic           = "Sum"
  threshold           = 0
  alarm_actions       = [var.sns_topic_arn]
}
