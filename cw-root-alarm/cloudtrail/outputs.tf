output "cloudtrail_arn" {
  description = "ARN of the created CloudTrail trail."
  value       = aws_cloudtrail.root_activity_trail.arn
}

output "cloudtrail_home_region" {
  description = "Home region of the CloudTrail."
  value       = aws_cloudtrail.root_activity_trail.home_region
}
output "cloudtrail_log_group_arn" {
  value = aws_cloudwatch_log_group.cloudtrail_log_group.arn
}
output "cloudwatch_log_group_arn" {
  value = var.cloudwatch_log_group_arn
}
