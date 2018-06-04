# SQS queue with server-side encryption example

Configuration in this directory creates single SQS queue with server-side encryption using specified KMS key.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Outputs

| Name | Description |
|------|-------------|
| dynamic_kms_sqs_queue_arn | The ARN of the SQS queue (with dynamic KMS key) |
| dynamic_kms_sqs_queue_id | The URL for the created Amazon SQS queue (with dynamic KMS key) |
| static_kms_this_sqs_queue_arn | The ARN of the SQS queue (with static KMS key) |
| static_kms_this_sqs_queue_id | The URL for the created Amazon SQS queue (with static KMS key) |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
