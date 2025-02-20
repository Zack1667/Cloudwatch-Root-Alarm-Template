provider "aws" {
  region  = var.aws_region  # default region 
  profile = var.aws_profile # aws profile used for sso, must be added to terraform.tfvars 
}

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

module "s3" {
  source        = "./s3"
  bucket_prefix = "cloudtrail-root-access-logs"
  aws_profile   = var.aws_profile # pass the profile from terraform.tfvars to module
}

module "iam" {
  source                   = "./iam"
  cloudwatch_log_group_arn = module.cloudwatch.log_group_arn
  aws_profile              = var.aws_profile # pass the profile from terraform.tfvars to module
}

module "sns" {
  source        = "./sns"
  email_address = var.email_address # email address must be specified in terraform.tfvars 
  account_id    = var.account_id    # account id must be specified in terraform.tfvars 
  aws_region    = var.aws_region
  aws_profile   = var.aws_profile # pass the profile from terraform.tfvars to module
}


module "cloudwatch" {
  source         = "./cloudwatch"
  log_group_name = "root-access-logs"
  sns_topic_arn  = module.sns.sns_topic_arn
  aws_profile    = var.aws_profile # pass the profile from terraform.tfvars to module
}

module "cloudtrail" {
  source                   = "./cloudtrail"
  s3_bucket_name           = module.s3.s3_bucket_name
  trail_name               = "root-activity-trail"
  cloudtrail_role_arn      = module.iam.cloudtrail_role_arn
  cloudwatch_log_group_arn = module.cloudwatch.log_group_arn
  s3_bucket_policy_arn     = module.s3.cloudtrail_bucket_policy_arn
  sns_topic_arn            = module.sns.sns_topic_arn
  aws_profile              = var.aws_profile # pass the profile from terraform.tfvars to module
}
