# Outputs
output "sns_topic_arn" {
  value = aws_sns_topic.root_account_alarm_topic.arn  
}

output "sns_topic_name" {
  value       = aws_sns_topic.root_account_alarm_topic.name
  description = "Name of the SNS topic for root account alerts."
}

output "email_subscription_endpoint" {
  value       = var.email_address
  description = "Email address subscribed to the SNS topic."
}
