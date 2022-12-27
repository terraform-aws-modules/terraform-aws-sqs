################################################################################
# Queue
################################################################################

resource "aws_sqs_queue" "this" {
  count = var.create ? 1 : 0

  content_based_deduplication       = var.content_based_deduplication
  deduplication_scope               = var.deduplication_scope
  delay_seconds                     = var.delay_seconds
  fifo_queue                        = var.fifo_queue
  fifo_throughput_limit             = var.fifo_throughput_limit
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  kms_master_key_id                 = var.sqs_managed_sse_enabled ? null : var.kms_master_key_id
  max_message_size                  = var.max_message_size
  message_retention_seconds         = var.message_retention_seconds
  name                              = var.use_name_prefix ? null : (var.fifo_queue ? "${trimsuffix(var.name, ".fifo")}.fifo" : var.name)
  name_prefix                       = var.use_name_prefix ? "${var.name}-" : null
  policy                            = var.policy
  receive_wait_time_seconds         = var.receive_wait_time_seconds
  sqs_managed_sse_enabled           = var.sqs_managed_sse_enabled
  visibility_timeout_seconds        = var.visibility_timeout_seconds

  tags = var.tags
}

################################################################################
# Re-drive Policy
################################################################################

resource "aws_sqs_queue_redrive_policy" "this" {
  count = var.create && !var.create_dlq && length(var.redrive_policy) > 0 ? 1 : 0

  queue_url      = aws_sqs_queue.this[0].url
  redrive_policy = jsonencode(var.redrive_policy)
}

resource "aws_sqs_queue_redrive_policy" "dlq" {
  count = var.create && var.create_dlq ? 1 : 0

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
  inter_dlq_name = try(coalesce(var.dlq_name, "${var.name}-dlq"), "")
  dlq_name       = var.fifo_queue ? "${trimsuffix(local.inter_dlq_name, ".fifo")}.fifo" : local.inter_dlq_name

  dlq_sqs_managed_sse_enabled = coalesce(var.dlq_sqs_managed_sse_enabled, var.sqs_managed_sse_enabled)
}

resource "aws_sqs_queue" "dlq" {
  count = var.create && var.create_dlq ? 1 : 0

  content_based_deduplication = try(coalesce(var.dlq_content_based_deduplication, var.content_based_deduplication), null)
  deduplication_scope         = try(coalesce(var.dlq_deduplication_scope, var.deduplication_scope), null)
  delay_seconds               = try(coalesce(var.dlq_delay_seconds, var.delay_seconds), null)
  # If source queue is FIFO, DLQ must also be FIFO and vice versa
  fifo_queue                        = var.fifo_queue
  fifo_throughput_limit             = var.fifo_throughput_limit
  kms_data_key_reuse_period_seconds = try(coalesce(var.dlq_kms_data_key_reuse_period_seconds, var.kms_data_key_reuse_period_seconds), null)
  kms_master_key_id                 = local.dlq_sqs_managed_sse_enabled ? null : try(coalesce(var.dlq_kms_master_key_id, var.kms_master_key_id), null)
  max_message_size                  = var.max_message_size
  message_retention_seconds         = try(coalesce(var.dlq_message_retention_seconds, var.message_retention_seconds), null)
  name                              = var.use_name_prefix ? null : local.dlq_name
  name_prefix                       = var.use_name_prefix ? "${local.dlq_name}-" : null
  policy                            = try(coalesce(var.dlq_policy, var.policy), null)
  receive_wait_time_seconds         = try(coalesce(var.dlq_receive_wait_time_seconds, var.receive_wait_time_seconds), null)
  sqs_managed_sse_enabled           = local.dlq_sqs_managed_sse_enabled
  visibility_timeout_seconds        = try(coalesce(var.dlq_visibility_timeout_seconds, var.visibility_timeout_seconds), null)

  tags = merge(var.tags, var.dlq_tags)
}

################################################################################
# Re-drive Allow Policy
################################################################################

resource "aws_sqs_queue_redrive_allow_policy" "this" {
  count = var.create && !var.create_dlq && length(var.redrive_allow_policy) > 0 ? 1 : 0

  queue_url            = aws_sqs_queue.this[0].url
  redrive_allow_policy = jsonencode(var.redrive_allow_policy)
}

resource "aws_sqs_queue_redrive_allow_policy" "dlq" {
  count = var.create && var.create_dlq ? 1 : 0

  queue_url = aws_sqs_queue.dlq[0].url
  redrive_allow_policy = jsonencode(merge(
    {
      redrivePermission = "byQueue",
      sourceQueueArns   = [aws_sqs_queue.this[0].arn]
    },
    var.dlq_redrive_allow_policy)
  )
}
