output "sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value = element(
    concat(
      aws_sqs_queue.this.*.id,
      [""],
    ),
    0,
  )
}

output "sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value = element(
    concat(
      aws_sqs_queue.this.*.arn,
      [""],
    ),
    0,
  )
}

output "sqs_queue_name" {
  description = "The name of the SQS queue"
  value = element(
    concat(
      data.aws_arn.this.*.resource,
      [""],
    ),
    0,
  )
}
