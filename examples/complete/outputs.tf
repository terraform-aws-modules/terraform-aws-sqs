# Default
output "default_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.default.sqs_queue_id
}

output "default_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.default.sqs_queue_arn
}

output "default_sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.default.sqs_queue_name
}

# CMK Encrypted
output "cmk_unencrypted_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.cmk_encrypted.sqs_queue_id
}

output "cmk_unencrypted_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.cmk_encrypted.sqs_queue_arn
}

output "cmk_sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.cmk_encrypted.sqs_queue_name
}

# SSE Encrypted
output "sse_encrypted_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.sse_encrypted.sqs_queue_id
}

output "sse_encrypted_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.sse_encrypted.sqs_queue_arn
}

output "sse_encrypted_sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.sse_encrypted.sqs_queue_name
}

# DLQ Re-drive
output "dlq_redrive_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.dlq_redrive.sqs_queue_id
}

output "dlq_redrive_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.dlq_redrive.sqs_queue_arn
}

output "dlq_redrive_sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.dlq_redrive.sqs_queue_name
}
