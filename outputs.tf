################################################################################
# Queue
################################################################################

output "queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = try(aws_sqs_queue.this[0].id, null)
}

output "queue_arn" {
  description = "The ARN of the SQS queue"
  value       = try(aws_sqs_queue.this[0].arn, null)
}

output "queue_arn_static" {
  description = "The ARN of the SQS queue. Use this to avoid cycle errors between resources (e.g., Step Functions)"
  value       = var.create && !var.use_name_prefix ? "arn:${local.partition}:sqs:${local.region}:${local.account_id}:${local.static_name}" : ""
}

output "queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = try(aws_sqs_queue.this[0].url, null)
}

output "queue_name" {
  description = "The name of the SQS queue"
  value       = try(aws_sqs_queue.this[0].name, null)
}

################################################################################
# Dead Letter Queue
################################################################################

output "dead_letter_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = try(aws_sqs_queue.dlq[0].id, null)
}

output "dead_letter_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = try(aws_sqs_queue.dlq[0].arn, null)
}

output "dead_letter_queue_arn_static" {
  description = "The ARN of the SQS queue. Use this to avoid cycle errors between resources (e.g., Step Functions)"
  value       = var.create && var.create_dlq && !var.use_name_prefix ? "arn:${local.partition}:sqs:${local.region}:${local.account_id}:${local.dlq_name}" : ""
}

output "dead_letter_queue_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue"
  value       = try(aws_sqs_queue.dlq[0].url, null)
}

output "dead_letter_queue_name" {
  description = "The name of the SQS queue"
  value       = try(aws_sqs_queue.dlq[0].name, null)
}
