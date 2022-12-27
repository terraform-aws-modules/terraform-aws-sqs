################################################################################
# Queue
################################################################################

output "sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = try(aws_sqs_queue.this[0].id, null)
}

output "sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = try(aws_sqs_queue.this[0].arn, null)
}

output "sqs_queue_url" {
  description = "Same as `id`: The URL for the created Amazon SQS queue."
  value       = try(aws_sqs_queue.this[0].url, null)
}

output "sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = try(aws_sqs_queue.this[0].name, null)
}
