module "wrapper" {
  source = "../"

  for_each = var.items

  create                            = try(each.value.create, var.defaults.create, true)
  name                              = try(each.value.name, var.defaults.name, null)
  name_prefix                       = try(each.value.name_prefix, var.defaults.name_prefix, null)
  visibility_timeout_seconds        = try(each.value.visibility_timeout_seconds, var.defaults.visibility_timeout_seconds, 30)
  message_retention_seconds         = try(each.value.message_retention_seconds, var.defaults.message_retention_seconds, 345600)
  max_message_size                  = try(each.value.max_message_size, var.defaults.max_message_size, 262144)
  delay_seconds                     = try(each.value.delay_seconds, var.defaults.delay_seconds, 0)
  receive_wait_time_seconds         = try(each.value.receive_wait_time_seconds, var.defaults.receive_wait_time_seconds, 0)
  policy                            = try(each.value.policy, var.defaults.policy, "")
  redrive_policy                    = try(each.value.redrive_policy, var.defaults.redrive_policy, "")
  redrive_allow_policy              = try(each.value.redrive_allow_policy, var.defaults.redrive_allow_policy, "")
  fifo_queue                        = try(each.value.fifo_queue, var.defaults.fifo_queue, false)
  content_based_deduplication       = try(each.value.content_based_deduplication, var.defaults.content_based_deduplication, false)
  kms_master_key_id                 = try(each.value.kms_master_key_id, var.defaults.kms_master_key_id, null)
  sqs_managed_sse_enabled           = try(each.value.sqs_managed_sse_enabled, var.defaults.sqs_managed_sse_enabled, false)
  kms_data_key_reuse_period_seconds = try(each.value.kms_data_key_reuse_period_seconds, var.defaults.kms_data_key_reuse_period_seconds, 300)
  deduplication_scope               = try(each.value.deduplication_scope, var.defaults.deduplication_scope, null)
  fifo_throughput_limit             = try(each.value.fifo_throughput_limit, var.defaults.fifo_throughput_limit, null)
  tags                              = try(each.value.tags, var.defaults.tags, {})
}
