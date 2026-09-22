variable "producer_role_arn" {
  description = "ARN of an existing IAM role that can send messages to the main queue. This does not grant access to the dead letter queue"
  type        = string
  default     = null
}

variable "consumer_role_arn" {
  description = "ARN of an existing IAM role that can consume messages from the main queue. This does not grant access to the dead letter queue"
  type        = string
  default     = null
}
