variable "log_group_name" {
  description = "Name for the CloudWatch Log Group."
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN of the SNS topic for alarm notifications."
  type        = string
}
variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "eu-west-1"
}
variable "aws_profile" {
  description = "AWS Profile for SSO"
  type        = string
}