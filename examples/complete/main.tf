provider "aws" {
  region = local.region
}

data "aws_caller_identity" "current" {}

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

  name            = "${local.name}-cmk"
  use_name_prefix = true

  kms_master_key_id                 = aws_kms_key.this.id
  kms_data_key_reuse_period_seconds = 3600

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

  # Policy
  create_queue_policy = true
  queue_policy_statements = {
    account = {
      sid = "AccountReadWrite"
      actions = [
        "sqs:SendMessage",
        "sqs:ReceiveMessage",
      ]
      principals = [
        {
          type        = "AWS"
          identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
        }
      ]
    }
  }

  # Dead letter queue
  create_dlq = true
  redrive_policy = {
    # default is 5 for this module
    maxReceiveCount = 10
  }

  # Dead letter queue policy
  create_dlq_queue_policy = true
  dlq_queue_policy_statements = {
    account = {
      sid = "AccountReadWrite"
      actions = [
        "sqs:SendMessage",
        "sqs:ReceiveMessage",
      ]
      principals = [
        {
          type        = "AWS"
          identifiers = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"]
        }
      ]
    }
  }

  tags = local.tags
}

module "disabled_sqs" {
  source = "../../"

  create = false
}

################################################################################
# Supporting resources
################################################################################

resource "aws_kms_key" "this" {}
