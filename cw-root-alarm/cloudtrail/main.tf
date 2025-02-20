data "aws_caller_identity" "current" {}
provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}
resource "aws_cloudwatch_log_group" "cloudtrail_log_group" {
  name = "cloudtrail-log-group"
}


resource "aws_cloudtrail" "root_activity_trail" {
  name                       = var.trail_name
  s3_bucket_name             = var.s3_bucket_name
  include_global_service_events = true
  is_multi_region_trail      = true
  enable_logging             = true

  cloud_watch_logs_role_arn  = var.cloudtrail_role_arn
  cloud_watch_logs_group_arn = var.cloudwatch_log_group_arn

  depends_on = [
    aws_cloudwatch_log_group.cloudtrail_log_group  
  ]

  event_selector {
    read_write_type           = "All"
    include_management_events = true

    data_resource {
      type   = "AWS::S3::Object"
      values = ["arn:aws:s3:::${var.s3_bucket_name}/"]
    }
  }
}
