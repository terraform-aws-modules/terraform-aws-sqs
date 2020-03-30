# AWS SQS Terraform module

Terraform module which creates SQS resources on AWS.

These types of resources are supported:

* [SQS queue](https://www.terraform.io/docs/providers/aws/r/sqs_queue.html) with optional [server-side encryption using KMS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html)

## Terraform versions

Terraform 0.12. Pin module version to `~> v2.0`. Submit pull-requests to `master` branch.

Terraform 0.11. Pin module version to `~> v1.0`. Submit pull-requests to `terraform011` branch.

## Usage

```hcl
module "user_queue" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "~> 2.0"

  name = "user"

  tags = {
    Service     = "user"
    Environment = "dev"
  }
}
```

## Examples

* [SQS queues with server-side encryption (SSE) using KMS and without SSE](https://github.com/terraform-aws-modules/terraform-aws-sqs/tree/master/examples/complete-sqs)

## Conditional creation

Sometimes you need to have a way to create SQS queue conditionally but Terraform does not allow to use `count` inside `module` block, so the solution is to specify argument `create`.

```hcl
# This SQS queue will not be created
module "user_queue" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "~> 2.0"

  create = false
  # ... omitted
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| content_based_deduplication | Enables content-based deduplication for FIFO queues | string | `false` | no |
| create | Whether to create SQS queue | string | `true` | no |
| delay_seconds | The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes) | string | `0` | no |
| fifo_queue | Boolean designating a FIFO queue | string | `false` | no |
| kms_data_key_reuse_period_seconds | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours) | string | `300` | no |
| kms_master_key_id | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK | string | `` | no |
| max_message_size | The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB) | string | `262144` | no |
| message_retention_seconds | The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days) | string | `345600` | no |
| name | This is the human-readable name of the queue. If omitted, Terraform will assign a random name. | string | `` | no |
| policy | The JSON policy for the SQS queue | string | `` | no |
| receive_wait_time_seconds | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds) | string | `0` | no |
| redrive_policy | The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string ("5") | string | `` | no |
| tags | A mapping of tags to assign to all resources | string | `<map>` | no |
| visibility_timeout_seconds | The visibility timeout for the queue. An integer from 0 to 43200 (12 hours) | string | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| this_sqs_queue_name | The name of the SQS queue |
| this_sqs_queue_arn | The ARN of the SQS queue |
| this_sqs_queue_id | The URL for the created Amazon SQS queue |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module managed by [Anton Babenko](https://github.com/antonbabenko).

## License

Apache 2 Licensed. See LICENSE for full details.
