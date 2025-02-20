output "s3_bucket_name" {
  value = aws_s3_bucket.cloudtrail_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.cloudtrail_bucket.arn
}

output "cloudtrail_bucket_policy_arn" {
  value = aws_s3_bucket_policy.cloudtrail_bucket_policy.id
}
