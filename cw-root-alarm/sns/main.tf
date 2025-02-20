provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}


resource "aws_sns_topic" "root_account_alarm_topic" {
  name = "root-account-activity-topic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.root_account_alarm_topic.arn
  protocol  = "email"
  endpoint  = var.email_address   
}


