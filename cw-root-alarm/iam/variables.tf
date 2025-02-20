variable "cloudwatch_log_group_arn" {
  description = "ARN of the CloudWatch Log Group."
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