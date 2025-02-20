provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}
resource "aws_iam_role" "cloudtrail_role" {
  name = "cloudtrail-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_role_policy" "cloudtrail_policy" {
  name   = "cloudtrail-policy"
  role   = aws_iam_role.cloudtrail_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = var.cloudwatch_log_group_arn
      }
    ]
  })
}


