
# Will create a bucket with a random bucket suffix using random provider using hex 
resource "random_id" "bucket_suffix" {
  byte_length = 3
}
provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}
# Declare the data source for current account ID
data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "cloudtrail_bucket" { # hex below
  bucket = "cloudtrail-root-access-logs-${random_id.bucket_suffix.hex}" # hex to ensure bucket is available, you can remove if you like
}

resource "aws_s3_bucket_policy" "cloudtrail_bucket_policy" {
  bucket = aws_s3_bucket.cloudtrail_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action    = "s3:PutObject"
        Resource  = "arn:aws:s3:::${aws_s3_bucket.cloudtrail_bucket.id}/AWSLogs/${data.aws_caller_identity.current.account_id}/*"
      },
      {
        Effect    = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action    = "s3:GetBucketAcl"
        Resource  = "arn:aws:s3:::${aws_s3_bucket.cloudtrail_bucket.id}"
      }
    ]
  })
}