output "this_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = "${element(concat(aws_sqs_queue.this.*.id, aws_sqs_queue.this_with_kms.*.id, list("")), 0)}"
}

output "this_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = "${element(concat(aws_sqs_queue.this.*.arn, aws_sqs_queue.this_with_kms.*.arn, list("")), 0)}"
}
