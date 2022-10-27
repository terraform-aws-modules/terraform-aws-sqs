output "sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = try(aws_sqs_queue.this[0].id, "")
}

output "sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = try(aws_sqs_queue.this[0].arn, "")
}

output "sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = try(data.aws_arn.this[0].resource, "")
}
