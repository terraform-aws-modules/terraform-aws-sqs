data "aws_iam_policy_document" "sqs_iam_send_policy" {
  count = "${var.create && local.create_this_sqs_queue == 1 ? 1 : 0}"
  statement {
    actions = [
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ListDeadLetterSourceQueues",
      "sqs:SendMessage",
    ]

    resources = [
      "${aws_sqs_queue.this.arn}",
    ]
  }
}

data "aws_iam_policy_document" "sqs_iam_send_policy_queue_with_kms" {
  count = "${var.create && local.create_this_sqs_queue == 0 ? 1 : 0}"
  statement {
    actions = [
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ListDeadLetterSourceQueues",
      "sqs:SendMessage",
    ]

    resources = [
      "${aws_sqs_queue.this_with_kms.arn}",
    ]
  }
}
