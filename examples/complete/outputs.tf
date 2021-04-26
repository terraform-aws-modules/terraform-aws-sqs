output "users_unencrypted_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.users_unencrypted.sqs_queue_id
}

output "users_unencrypted_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.users_unencrypted.sqs_queue_arn
}

output "users_encrypted_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value       = module.users_encrypted.sqs_queue_id
}

output "users_encrypted_sqs_queue_arn" {
  description = "The ARN of the SQS queue"
  value       = module.users_encrypted.sqs_queue_arn
}
