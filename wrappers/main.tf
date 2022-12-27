module "wrapper" {
  source = "../"

  for_each = var.items

  create                            = try(each.value.create, var.defaults.create, true)
  content_based_deduplication       = try(each.value.content_based_deduplication, var.defaults.content_based_deduplication, null)
  deduplication_scope               = try(each.value.deduplication_scope, var.defaults.deduplication_scope, null)
  delay_seconds                     = try(each.value.delay_seconds, var.defaults.delay_seconds, null)
  fifo_queue                        = try(each.value.fifo_queue, var.defaults.fifo_queue, false)
  fifo_throughput_limit             = try(each.value.fifo_throughput_limit, var.defaults.fifo_throughput_limit, null)
  kms_data_key_reuse_period_seconds = try(each.value.kms_data_key_reuse_period_seconds, var.defaults.kms_data_key_reuse_period_seconds, null)
  kms_master_key_id                 = try(each.value.kms_master_key_id, var.defaults.kms_master_key_id, null)
  max_message_size                  = try(each.value.max_message_size, var.defaults.max_message_size, null)
  message_retention_seconds         = try(each.value.message_retention_seconds, var.defaults.message_retention_seconds, null)
  name                              = try(each.value.name, var.defaults.name, null)
  use_name_prefix                   = try(each.value.use_name_prefix, var.defaults.use_name_prefix, false)
  policy                            = try(each.value.policy, var.defaults.policy, null)
  receive_wait_time_seconds         = try(each.value.receive_wait_time_seconds, var.defaults.receive_wait_time_seconds, null)
  redrive_allow_policy              = try(each.value.redrive_allow_policy, var.defaults.redrive_allow_policy, null)
  redrive_policy                    = try(each.value.redrive_policy, var.defaults.redrive_policy, null)
  sqs_managed_sse_enabled           = try(each.value.sqs_managed_sse_enabled, var.defaults.sqs_managed_sse_enabled, true)
  visibility_timeout_seconds        = try(each.value.visibility_timeout_seconds, var.defaults.visibility_timeout_seconds, null)
  tags                              = try(each.value.tags, var.defaults.tags, {})
}
