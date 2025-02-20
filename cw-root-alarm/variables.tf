variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "eu-west-1" # modify to your needs
}

variable "email_address" {
  description = "The email address to send notifications to."
  type        = string
}
variable "account_id" {
  description = "Your AWS Account ID."
  type        = string

}
variable "aws_profile" {
  description = "AWS Profile for SSO"
  type        = string
}
