output "static_kms_this_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue (with static KMS key)"
  value       = "${module.users_queue_with_kms_static.this_sqs_queue_id}"
}

output "static_kms_this_sqs_queue_arn" {
  description = "The ARN of the SQS queue (with static KMS key)"
  value       = "${module.users_queue_with_kms_static.this_sqs_queue_arn}"
}

output "dynamic_kms_sqs_queue_id" {
  description = "The URL for the created Amazon SQS queue (with dynamic KMS key)"
  value       = "${module.users_queue_with_kms_dynamic.this_sqs_queue_id}"
}

output "dynamic_kms_sqs_queue_arn" {
  description = "The ARN of the SQS queue (with dynamic KMS key)"
  value       = "${module.users_queue_with_kms_dynamic.this_sqs_queue_arn}"
}
