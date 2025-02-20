output "log_group_arn" {
  description = "ARN of the CloudWatch Log Group used by CloudTrail"
  value       = "${aws_cloudwatch_log_group.cloudtrail_log_group.arn}:*"  
}
