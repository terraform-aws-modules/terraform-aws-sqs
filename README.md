# AWS SQS Terraform module

Terraform module which creates SQS resources on AWS.

[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

## Usage

### FIFO Queue

```hcl
module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"

  name = "fifo"

  fifo_queue = true

  tags = {
    Environment = "dev"
  }
}
```

### Queue Encrypted w/ Customer Managed KMS Key

```hcl
module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"

  name = "cmk"

  kms_master_key_id                 = "0d1ba9e8-9421-498a-9c8a-01e9772b2924"
  kms_data_key_reuse_period_seconds = 3600

  tags = {
    Environment = "dev"
  }
}
```

### Queue w/ Dead Letter Queue

```hcl
module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"

  name = "example"

  create_dlq = true
  redrive_policy = {
    # default is 5 for this module
    maxReceiveCount = 10
  }

  tags = {
    Environment = "dev"
  }
}
```

### Subscribe Queue to SNS Topic

```hcl
module "sns" {
  source  = "terraform-aws-modules/sns/aws"
  version = ">= 5.0"

  name = "pub-sub"

  topic_policy_statements = {
    sqs = {
      sid = "SQSSubscribe"
      actions = [
        "sns:Subscribe",
        "sns:Receive",
      ]

      principals = [{
        type        = "AWS"
        identifiers = ["*"]
      }]

      conditions = [{
        test     = "StringLike"
        variable = "sns:Endpoint"
        values   = [module.sqs.queue_arn]
      }]
    }
  }

  subscriptions = {
    sqs = {
      protocol = "sqs"
      endpoint = module.sqs.queue_arn
    }
  }

  tags = {
    Environment = "dev"
  }
}

module "sqs" {
  source = "terraform-aws-modules/sqs/aws"

  name = "pub-sub"

  create_queue_policy = true
  queue_policy_statements = {
    sns = {
      sid     = "SNSPublish"
      actions = ["sqs:SendMessage"]

      principals = [
        {
          type        = "Service"
          identifiers = ["sns.amazonaws.com"]
        }
      ]

      conditions = [{
        test     = "ArnEquals"
        variable = "aws:SourceArn"
        values   = [module.sns.topic_arn]
      }]
    }
  }

  tags = {
    Environment = "dev"
  }
}
```

## Examples

- [Complete](https://github.com/terraform-aws-modules/terraform-aws-sqs/tree/master/examples/complete)

## Conditional Creation

The following values are provided to toggle on/off creation of the associated resources as desired:

```hcl
module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"

  # Disable creation of all resources
  create = false

  # Enable creation of queue policy
  create_queue_policy = true

  # Enable creation of dead letter queue
  create_dlq = true

  # Enable creation of dead letter queue policy
  create_dlq_queue_policy = true

  # ... omitted
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.36 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.36 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_sqs_queue.dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue) | resource |
| [aws_sqs_queue_policy.dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_sqs_queue_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_sqs_queue_redrive_allow_policy.dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_redrive_allow_policy) | resource |
| [aws_sqs_queue_redrive_allow_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_redrive_allow_policy) | resource |
| [aws_sqs_queue_redrive_policy.dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_redrive_policy) | resource |
| [aws_sqs_queue_redrive_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_redrive_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.dlq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content_based_deduplication"></a> [content\_based\_deduplication](#input\_content\_based\_deduplication) | Enables content-based deduplication for FIFO queues | `bool` | `null` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create SQS queue | `bool` | `true` | no |
| <a name="input_create_dlq"></a> [create\_dlq](#input\_create\_dlq) | Determines whether to create SQS dead letter queue | `bool` | `false` | no |
| <a name="input_create_dlq_queue_policy"></a> [create\_dlq\_queue\_policy](#input\_create\_dlq\_queue\_policy) | Whether to create SQS queue policy | `bool` | `false` | no |
| <a name="input_create_dlq_redrive_allow_policy"></a> [create\_dlq\_redrive\_allow\_policy](#input\_create\_dlq\_redrive\_allow\_policy) | Determines whether to create a redrive allow policy for the dead letter queue. | `bool` | `true` | no |
| <a name="input_create_queue_policy"></a> [create\_queue\_policy](#input\_create\_queue\_policy) | Whether to create SQS queue policy | `bool` | `false` | no |
| <a name="input_deduplication_scope"></a> [deduplication\_scope](#input\_deduplication\_scope) | Specifies whether message deduplication occurs at the message group or queue level | `string` | `null` | no |
| <a name="input_delay_seconds"></a> [delay\_seconds](#input\_delay\_seconds) | The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes) | `number` | `null` | no |
| <a name="input_dlq_content_based_deduplication"></a> [dlq\_content\_based\_deduplication](#input\_dlq\_content\_based\_deduplication) | Enables content-based deduplication for FIFO queues | `bool` | `null` | no |
| <a name="input_dlq_deduplication_scope"></a> [dlq\_deduplication\_scope](#input\_dlq\_deduplication\_scope) | Specifies whether message deduplication occurs at the message group or queue level | `string` | `null` | no |
| <a name="input_dlq_delay_seconds"></a> [dlq\_delay\_seconds](#input\_dlq\_delay\_seconds) | The time in seconds that the delivery of all messages in the queue will be delayed. An integer from 0 to 900 (15 minutes) | `number` | `null` | no |
| <a name="input_dlq_kms_data_key_reuse_period_seconds"></a> [dlq\_kms\_data\_key\_reuse\_period\_seconds](#input\_dlq\_kms\_data\_key\_reuse\_period\_seconds) | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours) | `number` | `null` | no |
| <a name="input_dlq_kms_master_key_id"></a> [dlq\_kms\_master\_key\_id](#input\_dlq\_kms\_master\_key\_id) | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK | `string` | `null` | no |
| <a name="input_dlq_message_retention_seconds"></a> [dlq\_message\_retention\_seconds](#input\_dlq\_message\_retention\_seconds) | The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days) | `number` | `null` | no |
| <a name="input_dlq_name"></a> [dlq\_name](#input\_dlq\_name) | This is the human-readable name of the queue. If omitted, Terraform will assign a random name | `string` | `null` | no |
| <a name="input_dlq_queue_policy_statements"></a> [dlq\_queue\_policy\_statements](#input\_dlq\_queue\_policy\_statements) | A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage | `any` | `{}` | no |
| <a name="input_dlq_receive_wait_time_seconds"></a> [dlq\_receive\_wait\_time\_seconds](#input\_dlq\_receive\_wait\_time\_seconds) | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds) | `number` | `null` | no |
| <a name="input_dlq_redrive_allow_policy"></a> [dlq\_redrive\_allow\_policy](#input\_dlq\_redrive\_allow\_policy) | The JSON policy to set up the Dead Letter Queue redrive permission, see AWS docs. | `any` | `{}` | no |
| <a name="input_dlq_sqs_managed_sse_enabled"></a> [dlq\_sqs\_managed\_sse\_enabled](#input\_dlq\_sqs\_managed\_sse\_enabled) | Boolean to enable server-side encryption (SSE) of message content with SQS-owned encryption keys | `bool` | `true` | no |
| <a name="input_dlq_tags"></a> [dlq\_tags](#input\_dlq\_tags) | A mapping of additional tags to assign to the dead letter queue | `map(string)` | `{}` | no |
| <a name="input_dlq_visibility_timeout_seconds"></a> [dlq\_visibility\_timeout\_seconds](#input\_dlq\_visibility\_timeout\_seconds) | The visibility timeout for the queue. An integer from 0 to 43200 (12 hours) | `number` | `null` | no |
| <a name="input_fifo_queue"></a> [fifo\_queue](#input\_fifo\_queue) | Boolean designating a FIFO queue | `bool` | `false` | no |
| <a name="input_fifo_throughput_limit"></a> [fifo\_throughput\_limit](#input\_fifo\_throughput\_limit) | Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group | `string` | `null` | no |
| <a name="input_kms_data_key_reuse_period_seconds"></a> [kms\_data\_key\_reuse\_period\_seconds](#input\_kms\_data\_key\_reuse\_period\_seconds) | The length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again. An integer representing seconds, between 60 seconds (1 minute) and 86,400 seconds (24 hours) | `number` | `null` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | The ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK | `string` | `null` | no |
| <a name="input_max_message_size"></a> [max\_message\_size](#input\_max\_message\_size) | The limit of how many bytes a message can contain before Amazon SQS rejects it. An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB) | `number` | `null` | no |
| <a name="input_message_retention_seconds"></a> [message\_retention\_seconds](#input\_message\_retention\_seconds) | The number of seconds Amazon SQS retains a message. Integer representing seconds, from 60 (1 minute) to 1209600 (14 days) | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | This is the human-readable name of the queue. If omitted, Terraform will assign a random name | `string` | `null` | no |
| <a name="input_override_dlq_queue_policy_documents"></a> [override\_dlq\_queue\_policy\_documents](#input\_override\_dlq\_queue\_policy\_documents) | List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid` | `list(string)` | `[]` | no |
| <a name="input_override_queue_policy_documents"></a> [override\_queue\_policy\_documents](#input\_override\_queue\_policy\_documents) | List of IAM policy documents that are merged together into the exported document. In merging, statements with non-blank `sid`s will override statements with the same `sid` | `list(string)` | `[]` | no |
| <a name="input_queue_policy_statements"></a> [queue\_policy\_statements](#input\_queue\_policy\_statements) | A map of IAM policy [statements](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document#statement) for custom permission usage | `any` | `{}` | no |
| <a name="input_receive_wait_time_seconds"></a> [receive\_wait\_time\_seconds](#input\_receive\_wait\_time\_seconds) | The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning. An integer from 0 to 20 (seconds) | `number` | `null` | no |
| <a name="input_redrive_allow_policy"></a> [redrive\_allow\_policy](#input\_redrive\_allow\_policy) | The JSON policy to set up the Dead Letter Queue redrive permission, see AWS docs. | `any` | `{}` | no |
| <a name="input_redrive_policy"></a> [redrive\_policy](#input\_redrive\_policy) | The JSON policy to set up the Dead Letter Queue, see AWS docs. Note: when specifying maxReceiveCount, you must specify it as an integer (5), and not a string ("5") | `any` | `{}` | no |
| <a name="input_source_dlq_queue_policy_documents"></a> [source\_dlq\_queue\_policy\_documents](#input\_source\_dlq\_queue\_policy\_documents) | List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s | `list(string)` | `[]` | no |
| <a name="input_source_queue_policy_documents"></a> [source\_queue\_policy\_documents](#input\_source\_queue\_policy\_documents) | List of IAM policy documents that are merged together into the exported document. Statements must have unique `sid`s | `list(string)` | `[]` | no |
| <a name="input_sqs_managed_sse_enabled"></a> [sqs\_managed\_sse\_enabled](#input\_sqs\_managed\_sse\_enabled) | Boolean to enable server-side encryption (SSE) of message content with SQS-owned encryption keys | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to all resources | `map(string)` | `{}` | no |
| <a name="input_use_name_prefix"></a> [use\_name\_prefix](#input\_use\_name\_prefix) | Determines whether `name` is used as a prefix | `bool` | `false` | no |
| <a name="input_visibility_timeout_seconds"></a> [visibility\_timeout\_seconds](#input\_visibility\_timeout\_seconds) | The visibility timeout for the queue. An integer from 0 to 43200 (12 hours) | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dead_letter_queue_arn"></a> [dead\_letter\_queue\_arn](#output\_dead\_letter\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_dead_letter_queue_arn_static"></a> [dead\_letter\_queue\_arn\_static](#output\_dead\_letter\_queue\_arn\_static) | The ARN of the SQS queue. Use this to avoid cycle errors between resources (e.g., Step Functions) |
| <a name="output_dead_letter_queue_id"></a> [dead\_letter\_queue\_id](#output\_dead\_letter\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_dead_letter_queue_name"></a> [dead\_letter\_queue\_name](#output\_dead\_letter\_queue\_name) | The name of the SQS queue |
| <a name="output_dead_letter_queue_url"></a> [dead\_letter\_queue\_url](#output\_dead\_letter\_queue\_url) | Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_queue_arn"></a> [queue\_arn](#output\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_queue_arn_static"></a> [queue\_arn\_static](#output\_queue\_arn\_static) | The ARN of the SQS queue. Use this to avoid cycle errors between resources (e.g., Step Functions) |
| <a name="output_queue_id"></a> [queue\_id](#output\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_queue_name"></a> [queue\_name](#output\_queue\_name) | The name of the SQS queue |
| <a name="output_queue_url"></a> [queue\_url](#output\_queue\_url) | Same as `queue_id`: The URL for the created Amazon SQS queue |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Authors

Module is maintained by [Anton Babenko](https://github.com/antonbabenko) with help from [these awesome contributors](https://github.com/terraform-aws-modules/terraform-aws-sqs/graphs/contributors).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/terraform-aws-modules/terraform-aws-sqs/tree/master/LICENSE) for full details.
