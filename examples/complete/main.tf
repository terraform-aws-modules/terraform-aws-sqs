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

  name = "${local.name}-default"

  tags = local.tags
}

module "fifo_sqs" {
  source = "../../"

  # `.fifo` is automatically appended to the name
  # This also means that `use_name_prefix` cannot be used on FIFO queues
  name       = local.name
  fifo_queue = true

  tags = local.tags
}

module "unencrypted_sqs" {
  source = "../../"

  name                    = "${local.name}-unencrypted"
  sqs_managed_sse_enabled = false

  tags = local.tags
}

module "cmk_encrypted_sqs" {
  source = "../../"

  name              = "${local.name}-cmk"
  use_name_prefix   = true
  kms_master_key_id = aws_kms_key.this.id

  tags = local.tags
}

module "sse_encrypted_sqs" {
  source = "../../"

  name                    = "${local.name}-sse"
  sqs_managed_sse_enabled = true

  tags = local.tags
}

module "sqs_with_dlq" {
  source = "../../"

  name = "${local.name}-sqs-with-dlq"

  create_dlq = true
  redrive_policy = {
    # default is 5 for this module
    maxReceiveCount = 10
  }

  tags = local.tags
}

module "dlq_redrive_sqs" {
  source = "../../"

  name = "${local.name}-sqs-dlq-redrive"

  redrive_allow_policy = {
    redrivePermission = "byQueue",
    sourceQueueArns   = [module.sse_encrypted_sqs.queue_arn]
  }

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

module "disabled_sqs" {
  source = "../../"

  create = false
}

################################################################################
# Supporting resources
################################################################################

data "aws_caller_identity" "current" {}

resource "aws_kms_key" "this" {}
