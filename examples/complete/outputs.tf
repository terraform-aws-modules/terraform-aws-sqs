# Default
output "default_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.default_sqs.queue_id
}

output "default_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.default_sqs.queue_arn
}

output "default_sqs_queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = module.default_sqs.queue_url
}

output "default_sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.default_sqs.queue_name
}

output "default_sqs_dlq_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.default_sqs.dead_letter_queue_id
}

output "default_sqs_dlq_arn" {
  description = "The ARN of the SQS queue"
  value       = module.default_sqs.dead_letter_queue_arn
}

output "default_sqs_dlq_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue"
  value       = module.default_sqs.dead_letter_queue_url
}

output "default_sqs_dlq_name" {
  description = "The name of the SQS queue"
  value       = module.default_sqs.dead_letter_queue_name
}

# FIFO
output "fifo_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.fifo_sqs.queue_id
}

output "fifo_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.fifo_sqs.queue_arn
}

output "fifo_sqs_queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = module.fifo_sqs.queue_url
}

output "fifo_sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.fifo_sqs.queue_name
}

output "fifo_sqs_dlq_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.fifo_sqs.dead_letter_queue_id
}

output "fifo_sqs_dlq_arn" {
  description = "The ARN of the SQS queue"
  value       = module.fifo_sqs.dead_letter_queue_arn
}

output "fifo_sqs_dlq_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue"
  value       = module.fifo_sqs.dead_letter_queue_url
}

output "fifo_sqs_dlq_name" {
  description = "The name of the SQS queue"
  value       = module.fifo_sqs.dead_letter_queue_name
}

# Unencrypted
output "unencrypted_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.unencrypted_sqs.queue_id
}

output "unencrypted_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.unencrypted_sqs.queue_arn
}

output "unencrypted_sqs_queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = module.unencrypted_sqs.queue_url
}

output "unencrypted_sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.unencrypted_sqs.queue_name
}

output "unencrypted_sqs_dlq_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.unencrypted_sqs.dead_letter_queue_id
}

output "unencrypted_sqs_dlq_arn" {
  description = "The ARN of the SQS queue"
  value       = module.unencrypted_sqs.dead_letter_queue_arn
}

output "unencrypted_sqs_dlq_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue"
  value       = module.unencrypted_sqs.dead_letter_queue_url
}

output "unencrypted_sqs_dlq_name" {
  description = "The name of the SQS queue"
  value       = module.unencrypted_sqs.dead_letter_queue_name
}

# CMK Encrypted
output "cmk_encrypted_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.cmk_encrypted_sqs.queue_id
}

output "cmk_encrypted_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.cmk_encrypted_sqs.queue_arn
}

output "cmk_encrypted_sqs_queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = module.cmk_encrypted_sqs.queue_url
}

output "cmk_encrypted_sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.cmk_encrypted_sqs.queue_name
}

output "cmk_encrypted_sqs_dlq_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.cmk_encrypted_sqs.dead_letter_queue_id
}

output "cmk_encrypted_sqs_dlq_arn" {
  description = "The ARN of the SQS queue"
  value       = module.cmk_encrypted_sqs.dead_letter_queue_arn
}

output "cmk_encrypted_sqs_dlq_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue"
  value       = module.cmk_encrypted_sqs.dead_letter_queue_url
}

output "cmk_encrypted_sqs_dlq_name" {
  description = "The name of the SQS queue"
  value       = module.cmk_encrypted_sqs.dead_letter_queue_name
}

# SSE Encrypted
output "sse_encrypted_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.sse_encrypted_sqs.queue_id
}

output "sse_encrypted_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.sse_encrypted_sqs.queue_arn
}

output "sse_encrypted_sqs_queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = module.sse_encrypted_sqs.queue_url
}

output "sse_encrypted_sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.sse_encrypted_sqs.queue_name
}

output "sse_encrypted_sqs_dlq_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.sse_encrypted_sqs.dead_letter_queue_id
}

output "sse_encrypted_sqs_dlq_arn" {
  description = "The ARN of the SQS queue"
  value       = module.sse_encrypted_sqs.dead_letter_queue_arn
}

output "sse_encrypted_sqs_dlq_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue"
  value       = module.sse_encrypted_sqs.dead_letter_queue_url
}

output "sse_encrypted_sqs_dlq_name" {
  description = "The name of the SQS queue"
  value       = module.sse_encrypted_sqs.dead_letter_queue_name
}

# SSE Encrypted Dead Letter Quue
output "sse_encrypted_dlq_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.sse_encrypted_dlq_sqs.queue_id
}

output "sse_encrypted_dlq_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.sse_encrypted_dlq_sqs.queue_arn
}

output "sse_encrypted_dlq_sqs_queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = module.sse_encrypted_dlq_sqs.queue_url
}

output "sse_encrypted_dlq_sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.sse_encrypted_dlq_sqs.queue_name
}

output "sse_encrypted_dlq_sqs_dlq_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.sse_encrypted_dlq_sqs.dead_letter_queue_id
}

output "sse_encrypted_dlq_sqs_dlq_arn" {
  description = "The ARN of the SQS queue"
  value       = module.sse_encrypted_dlq_sqs.dead_letter_queue_arn
}

output "sse_encrypted_dlq_sqs_dlq_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue"
  value       = module.sse_encrypted_dlq_sqs.dead_letter_queue_url
}

output "sse_encrypted_dlq_sqs_dlq_name" {
  description = "The name of the SQS queue"
  value       = module.sse_encrypted_dlq_sqs.dead_letter_queue_name
}

# With Dead Letter Queue
output "sqs_with_dlq_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.sqs_with_dlq.queue_id
}

output "sqs_with_dlq_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.sqs_with_dlq.queue_arn
}

output "sqs_with_dlq_queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = module.sqs_with_dlq.queue_url
}

output "sqs_with_dlq_queue_name" {
  description = "The name of the SQS queue"
  value       = module.sqs_with_dlq.queue_name
}

output "sqs_with_dlq_dlq_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.sqs_with_dlq.dead_letter_queue_id
}

output "sqs_with_dlq_dlq_arn" {
  description = "The ARN of the SQS queue"
  value       = module.sqs_with_dlq.dead_letter_queue_arn
}

output "sqs_with_dlq_dlq_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue"
  value       = module.sqs_with_dlq.dead_letter_queue_url
}

output "sqs_with_dlq_dlq_name" {
  description = "The name of the SQS queue"
  value       = module.sqs_with_dlq.dead_letter_queue_name
}

# Disabled
output "disabled_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.disabled_sqs.queue_id
}

output "disabled_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.disabled_sqs.queue_arn
}

output "disabled_sqs_queue_url" {
  description = "Same as `queue_id`: The URL for the created Amazon SQS queue"
  value       = module.disabled_sqs.queue_url
}

output "disabled_sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.disabled_sqs.queue_name
}

output "disabled_sqs_dlq_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.disabled_sqs.dead_letter_queue_id
}

output "disabled_sqs_dlq_arn" {
  description = "The ARN of the SQS queue"
  value       = module.disabled_sqs.dead_letter_queue_arn
}

output "disabled_sqs_dlq_url" {
  description = "Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue"
  value       = module.disabled_sqs.dead_letter_queue_url
}

output "disabled_sqs_dlq_name" {
  description = "The name of the SQS queue"
  value       = module.disabled_sqs.dead_letter_queue_name
}
