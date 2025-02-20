variable "trail_name" {
  description = "The name of the CloudTrail trail."
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket where CloudTrail logs will be stored."
  type        = string
}

variable "cloudwatch_log_group_arn" {
  description = "ARN of the CloudWatch Log Group for CloudTrail logs."
  type        = string
}

variable "cloudtrail_role_arn" {
  description = "ARN of the IAM role for CloudTrail to assume."
  type        = string
}
variable "s3_bucket_policy_arn" {
  description = "The ARN of the S3 bucket policy."
  type        = string
}
variable "sns_topic_arn" {
  description = "SNS topic to send root account usage alerts."
  type        = string
}

variable "aws_profile" {
  description = "AWS Profile for SSO"
  type        = string
}
variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "eu-west-1"
}