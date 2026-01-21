data "aws_region" "current" {
  count = var.create ? 1 : 0

  region = var.region
}

data "aws_caller_identity" "current" {
  count = var.create ? 1 : 0
}

data "aws_partition" "current" {
  count = var.create ? 1 : 0
}

locals {
  region     = try(data.aws_region.current[0].region, "")
  account_id = try(data.aws_caller_identity.current[0].account_id, "")
  partition  = try(data.aws_partition.current[0].id, "aws")
}

################################################################################
# Queue
################################################################################

locals {
  name        = try(trimsuffix(var.name, ".fifo"), "")
  static_name = var.fifo_queue ? var.name : local.name
}

resource "aws_sqs_queue" "this" {
  count = var.create ? 1 : 0

  region = var.region

  content_based_deduplication       = var.content_based_deduplication
  deduplication_scope               = var.deduplication_scope
  delay_seconds                     = var.delay_seconds
  fifo_queue                        = var.fifo_queue
  fifo_throughput_limit             = var.fifo_throughput_limit
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  kms_master_key_id                 = var.kms_master_key_id
  max_message_size                  = var.max_message_size
  message_retention_seconds         = var.message_retention_seconds
  name                              = var.use_name_prefix ? null : (var.fifo_queue ? "${local.name}.fifo" : local.name)
  name_prefix                       = var.use_name_prefix ? "${local.name}-" : null
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  sqs_managed_sse_enabled           = var.kms_master_key_id != null ? null : var.sqs_managed_sse_enabled
  visibility_timeout_seconds        = var.visibility_timeout_seconds

  tags = var.tags
}

################################################################################
# Queue Policy
################################################################################

data "aws_iam_policy_document" "this" {
  count = var.create && var.create_queue_policy ? 1 : 0

  source_policy_documents   = var.source_queue_policy_documents
  override_policy_documents = var.override_queue_policy_documents

  dynamic "statement" {
    for_each = var.queue_policy_statements != null ? var.queue_policy_statements : {}

    content {
      sid         = try(coalesce(statement.value.sid, statement.key))
      actions     = statement.value.actions
      not_actions = statement.value.not_actions
      effect      = statement.value.effect
      # This avoids the chicken vs the egg scenario since its embedded and can reference the queue
      resources     = statement.value.resources != null ? statement.value.resources : [aws_sqs_queue.this[0].arn]
      not_resources = statement.value.not_resources

      dynamic "principals" {
        for_each = statement.value.principals != null ? statement.value.principals : []

        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "not_principals" {
        for_each = statement.value.not_principals != null ? statement.value.not_principals : []

        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = statement.value.condition != null ? statement.value.condition : []

        content {
          test     = condition.value.test
          values   = condition.value.values
          variable = condition.value.variable
        }
      }
      # TODO - remove at next breaking change
      dynamic "condition" {
        for_each = statement.value.conditions != null ? statement.value.conditions : []

        content {
          test     = condition.value.test
          values   = condition.value.values
          variable = condition.value.variable
        }
      }
    }
  }
}

resource "aws_sqs_queue_policy" "this" {
  count = var.create && var.create_queue_policy ? 1 : 0

  region = var.region

  queue_url = aws_sqs_queue.this[0].url
  policy    = data.aws_iam_policy_document.this[0].json
}

################################################################################
# Re-drive Policy
################################################################################

resource "aws_sqs_queue_redrive_policy" "this" {
  count = var.create && !var.create_dlq && length(var.redrive_policy) > 0 ? 1 : 0

  region = var.region

  queue_url      = aws_sqs_queue.this[0].url
  redrive_policy = jsonencode(var.redrive_policy)
}

resource "aws_sqs_queue_redrive_policy" "dlq" {
  count = var.create && var.create_dlq ? 1 : 0

  region = var.region

  queue_url = aws_sqs_queue.this[0].url
  redrive_policy = jsonencode(
    merge(
      {
        deadLetterTargetArn = aws_sqs_queue.dlq[0].arn
        maxReceiveCount     = 5
      },
      var.redrive_policy
    )
  )
}

################################################################################
# Dead Letter Queue
################################################################################

locals {
  stripped_dlq_name = try(trimsuffix(var.dlq_name, ".fifo"), "")
  inter_dlq_name    = try(coalesce(local.stripped_dlq_name, "${local.name}-dlq"), "")
  dlq_name          = var.fifo_queue && !var.use_name_prefix ? "${local.inter_dlq_name}.fifo" : local.inter_dlq_name

  dlq_kms_master_key_id       = try(coalesce(var.dlq_kms_master_key_id, var.kms_master_key_id), null)
  dlq_sqs_managed_sse_enabled = coalesce(var.dlq_sqs_managed_sse_enabled, var.sqs_managed_sse_enabled)
}

resource "aws_sqs_queue" "dlq" {
  count = var.create && var.create_dlq ? 1 : 0

  region = var.region

  content_based_deduplication = try(coalesce(var.dlq_content_based_deduplication, var.content_based_deduplication), null)
  deduplication_scope         = try(coalesce(var.dlq_deduplication_scope, var.deduplication_scope), null)
  delay_seconds               = try(coalesce(var.dlq_delay_seconds, var.delay_seconds), null)
  # If source queue is FIFO, DLQ must also be FIFO and vice versa
  fifo_queue                        = var.fifo_queue
  fifo_throughput_limit             = try(coalesce(var.dlq_fifo_throughput_limit, var.fifo_throughput_limit), null)
  kms_data_key_reuse_period_seconds = try(coalesce(var.dlq_kms_data_key_reuse_period_seconds, var.kms_data_key_reuse_period_seconds), null)
  kms_master_key_id                 = local.dlq_kms_master_key_id
  max_message_size                  = var.max_message_size
  message_retention_seconds         = try(coalesce(var.dlq_message_retention_seconds, var.message_retention_seconds), null)
  name                              = var.use_name_prefix ? null : local.dlq_name
  name_prefix                       = var.use_name_prefix ? "${local.dlq_name}-" : null
  receive_wait_time_seconds         = try(coalesce(var.dlq_receive_wait_time_seconds, var.receive_wait_time_seconds), null)
  sqs_managed_sse_enabled           = local.dlq_kms_master_key_id != null ? null : local.dlq_sqs_managed_sse_enabled
  visibility_timeout_seconds        = try(coalesce(var.dlq_visibility_timeout_seconds, var.visibility_timeout_seconds), null)

  tags = merge(var.tags, var.dlq_tags)
}

################################################################################
# Queue Policy
################################################################################

data "aws_iam_policy_document" "dlq" {
  count = var.create && var.create_dlq && var.create_dlq_queue_policy ? 1 : 0

  source_policy_documents   = var.source_dlq_queue_policy_documents
  override_policy_documents = var.override_dlq_queue_policy_documents

  dynamic "statement" {
    for_each = var.dlq_queue_policy_statements != null ? var.dlq_queue_policy_statements : {}

    content {
      sid         = try(coalesce(statement.value.sid, statement.key))
      actions     = statement.value.actions
      not_actions = statement.value.not_actions
      effect      = statement.value.effect
      # This avoids the chicken vs the egg scenario since its embedded and can reference the queue
      resources     = statement.value.resources != null ? statement.value.resources : [aws_sqs_queue.dlq[0].arn]
      not_resources = statement.value.not_resources

      dynamic "principals" {
        for_each = statement.value.principals != null ? statement.value.principals : []

        content {
          type        = principals.value.type
          identifiers = principals.value.identifiers
        }
      }

      dynamic "not_principals" {
        for_each = statement.value.not_principals != null ? statement.value.not_principals : []

        content {
          type        = not_principals.value.type
          identifiers = not_principals.value.identifiers
        }
      }

      dynamic "condition" {
        for_each = statement.value.condition != null ? statement.value.condition : []

        content {
          test     = condition.value.test
          values   = condition.value.values
          variable = condition.value.variable
        }
      }
      # TODO - remove at next breaking change
      dynamic "condition" {
        for_each = statement.value.conditions != null ? statement.value.conditions : []

        content {
          test     = condition.value.test
          values   = condition.value.values
          variable = condition.value.variable
        }
      }
    }
  }
}

resource "aws_sqs_queue_policy" "dlq" {
  count = var.create && var.create_dlq && var.create_dlq_queue_policy ? 1 : 0

  region = var.region

  queue_url = aws_sqs_queue.dlq[0].url
  policy    = data.aws_iam_policy_document.dlq[0].json
}

################################################################################
# Re-drive Allow Policy
################################################################################

resource "aws_sqs_queue_redrive_allow_policy" "this" {
  count = var.create && !var.create_dlq && length(var.redrive_allow_policy) > 0 ? 1 : 0

  region = var.region

  queue_url            = aws_sqs_queue.this[0].url
  redrive_allow_policy = jsonencode(var.redrive_allow_policy)
}

resource "aws_sqs_queue_redrive_allow_policy" "dlq" {
  count = var.create && var.create_dlq && var.create_dlq_redrive_allow_policy ? 1 : 0

  region = var.region

  queue_url = aws_sqs_queue.dlq[0].url
  redrive_allow_policy = jsonencode(merge(
    {
      redrivePermission = "byQueue",
      sourceQueueArns   = [aws_sqs_queue.this[0].arn]
    },
    var.dlq_redrive_allow_policy)
  )
}
