# AWS Root Account Monitoring with Terraform

This Terraform configuration sets up AWS monitoring for root account activity across multiple AWS accounts using AWS SSO authentication. It provisions and configures the following AWS services:

- **CloudTrail**: Captures root account activity and logs it to an S3 bucket.
- **CloudWatch Logs**: Stores and monitors CloudTrail logs.
- **CloudWatch Alarms**: Triggers an alert if root account activity is detected.
- **SNS (Simple Notification Service)**: Sends notifications via email when an alarm is triggered.
- **IAM**: Manages necessary permissions for CloudTrail and CloudWatch integration.
- **S3**: Stores CloudTrail logs securely.

---

## 📌 Prerequisites

Ensure you have the following installed and configured:

- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [AWS CLI](https://aws.amazon.com/cli/) with AWS SSO authentication configured
- AWS profiles set up for each account using `aws configure sso`

---

## 🚀 Deployment Steps

### 1️⃣ Clone the Repository

```sh
git clone https://github.com/Zack1667/Cloudwatch-Root-Alarm-Template.git
cd aws-root-account-monitoring
```

### 2️⃣ Configure Terraform Variables 

aws_region    = "eu-west-1"
aws_profile   = "your-sso-profile"
email_address = "your-email@example.com"
account_id    = "123456789012"

### 3️⃣ Initialize Terraform 

```sh
terraform init
```

### 4️⃣ Plan the Deployment 

```sh
terraform plan
```

### 5️⃣ Apply the Configuration

```sh
terraform apply
```

📡 Deploying to Multiple AWS Accounts

To deploy across multiple AWS accounts, modify the aws_profile variable for each account:

```sh

AWS_PROFILE=aws-account-profile terraform apply -auto-approve

```

Alternatively, create separate terraform.tfvars files for each account:

```sh

terraform apply -var-file=terraform-account1.tfvars -auto-approve
terraform apply -var-file=terraform-account2.tfvars -auto-approve
```

You can also structure your deployment using Terraform workspaces:

```sh

terraform workspace new account1
terraform workspace select account1
AWS_PROFILE=account1-profile terraform apply -auto-approve

```

### 🛑 Cleanup 

To destroy all resources created by Terraform:

```sh

terraform destroy -auto-approve

```

### 🤝 Contributing
Feel free to submit issues or pull requests to improve this project!

