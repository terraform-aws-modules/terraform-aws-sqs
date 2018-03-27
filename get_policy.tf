data "aws_iam_policy_document" "sqs_iam_get_policy" {
  count = "${var.create && local.create_this_sqs_queue == 1 ? 1 : 0}"
  statement {
    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ListDeadLetterSourceQueues",
      "sqs:ReceiveMessage",
    ]

    resources = [
      "${aws_sqs_queue.this.arn}",
    ]
  }
}

data "aws_iam_policy_document" "sqs_iam_get_policy_queue_with_kms" {
  count = "${var.create && local.create_this_sqs_queue == 0 ? 1 : 0}"
  statement {
    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ListDeadLetterSourceQueues",
      "sqs:ReceiveMessage",
    ]

    resources = [
      "${aws_sqs_queue.this_with_kms.arn}",
    ]
  }
}

