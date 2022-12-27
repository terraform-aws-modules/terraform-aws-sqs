provider "aws" {
  region = local.region
}

locals {
  name   = "ex-${basename(path.cwd)}"
  region = "eu-west-1"

  tags = {
    Example    = local.name
    GithubRepo = "terraform-aws-sqs"
    GithubOrg  = "terraform-aws-modules"
  }
}

################################################################################
# SQS Module
################################################################################

module "default_sqs" {
  source = "../../"

  name = local.name

  tags = local.tags
}

module "cmk_encrypted_sqs" {
  source = "../../"

  name_prefix       = "${local.name}-cmk-"
  kms_master_key_id = aws_kms_key.this.id

  tags = local.tags
}

module "sse_encrypted_sqs" {
  source = "../../"

  name_prefix             = "${local.name}-sse-"
  sqs_managed_sse_enabled = true

  tags = local.tags
}

module "dlq_redrive_sqs" {
  source = "../../"

  name_prefix = "${local.name}-sqs-dlq-redrive-"

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [module.sse_encrypted_sqs.queue_arn]
  })

  tags = local.tags
}

resource "aws_sqs_queue_policy" "sse_encrypted_policy" {
  queue_url = module.sse_encrypted_sqs.queue_id

  policy = <<-EOF
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
          "Resource": "${module.sse_encrypted_sqs.queue_arn}"
        }
      ]
    }
  EOF
}

################################################################################
# Supporting resources
################################################################################

data "aws_caller_identity" "current" {}

resource "aws_kms_key" "this" {}
