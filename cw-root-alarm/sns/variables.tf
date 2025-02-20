variable "email_address" {
  description = "The email address to receive the root account activity alerts."
  type        = string
}
variable "account_id" {
  description = "Your AWS Account ID."
  type = string
  
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