locals {
  create_this_sqs_queue = "${var.kms_master_key_id == "" ? 1 : 0}"
}

resource "random_string" "id" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_sqs_queue" "this" {
  count = "${var.create && local.create_this_sqs_queue == 1 ? 1 : 0}"

  name = "${var.name}"

  visibility_timeout_seconds  = "${var.visibility_timeout_seconds}"
  message_retention_seconds   = "${var.message_retention_seconds}"
  max_message_size            = "${var.max_message_size}"
  delay_seconds               = "${var.delay_seconds}"
  receive_wait_time_seconds   = "${var.receive_wait_time_seconds}"
  policy                      = "${var.policy}"
  redrive_policy              = "${var.redrive_policy}"
  fifo_queue                  = "${var.fifo_queue}"
  content_based_deduplication = "${var.content_based_deduplication}"

  tags = "${var.tags}"
}

resource "aws_sqs_queue" "this_with_kms" {
  count = "${var.create && local.create_this_sqs_queue == 0 ? 1 : 0}"

  name = "${var.name}"

  visibility_timeout_seconds  = "${var.visibility_timeout_seconds}"
  message_retention_seconds   = "${var.message_retention_seconds}"
  max_message_size            = "${var.max_message_size}"
  delay_seconds               = "${var.delay_seconds}"
  receive_wait_time_seconds   = "${var.receive_wait_time_seconds}"
  policy                      = "${var.policy}"
  redrive_policy              = "${var.redrive_policy}"
  fifo_queue                  = "${var.fifo_queue}"
  content_based_deduplication = "${var.content_based_deduplication}"

  kms_master_key_id                 = "${var.kms_master_key_id}"
  kms_data_key_reuse_period_seconds = "${var.kms_data_key_reuse_period_seconds}"

  tags = "${var.tags}"
}

resource "aws_iam_policy" "sqs_iam_send_policy" {
  count  = "${var.create && local.create_this_sqs_queue == 1 ? 1 : 0}"
  name   = "sqs-iam-send-policy-${var.name}-${random_string.id.result}"
  path   = "/"
  policy = "${data.aws_iam_policy_document.sqs_iam_send_policy.json}"
}

resource "aws_iam_policy" "sqs_iam_send_policy_queue_with_kms" {
  count  = "${var.create && local.create_this_sqs_queue == 0 ? 1 : 0}"
  name   = "sqs-kms-iam-send-policy-${var.name}-${random_string.id.result}"
  path   = "/"
  policy = "${data.aws_iam_policy_document.sqs_iam_send_policy_queue_with_kms.json}"
}

resource "aws_iam_policy" "sqs_iam_get_policy" {
  count  = "${var.create && local.create_this_sqs_queue == 1 ? 1 : 0}"
  name   = "sqs-iam-get-policy-${var.name}-${random_string.id.result}"
  path   = "/"
  policy = "${data.aws_iam_policy_document.sqs_iam_get_policy.json}"
}

resource "aws_iam_policy" "sqs_iam_get_policy_queue_with_kms" {
  count  = "${var.create && local.create_this_sqs_queue == 0 ? 1 : 0}"
  name   = "sqs-kms-iam-get-policy-${var.name}-${random_string.id.result}"
  path   = "/"
  policy = "${data.aws_iam_policy_document.sqs_iam_get_policy_queue_with_kms.json}"
}
