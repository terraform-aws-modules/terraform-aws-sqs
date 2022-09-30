provider "aws" {
  region = "eu-west-1"
}

data "aws_caller_identity" "current" {}

resource "aws_kms_key" "this" {}

module "users_unencrypted" {
  source = "../../"

  name = "users-unencrypted"

  tags = {
    Secure = "false"
  }
}

module "users_encrypted" {
  source = "../../"

  name_prefix = "users-encrypted-"

  kms_master_key_id = aws_kms_key.this.id

  tags = {
    Secure = "true"
  }
}

module "users_encrypted_with_sse" {
  source = "../../"

  name_prefix = "users-encrypted-sse-"

  sqs_managed_sse_enabled = true

  tags = {
    Secure = "true"
  }
}


module "sqs_dlq_allow_redrive_policy" {
  source = "../../"

  name_prefix = "sqs-dlq-allow-redrive-policy-example"

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [module.users_encrypted.sqs_queue_arn]
  })

  tags = {
    Secure = "true"
  }
}

resource "aws_sqs_queue_policy" "users_unencrypted_policy" {
  queue_url = module.users_unencrypted.sqs_queue_id

  policy = <<EOF
  {
    "Version": "2008-10-17",
    "Id": " policy",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        "Action": [
          "SQS:SendMessage",
          "SQS:ReceiveMessage"
        ],
        "Resource": "${module.users_unencrypted.sqs_queue_arn}"
      }
    ]
  }
  EOF
}
