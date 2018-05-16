# Simple SQS queue example

Configuration in this directory creates single SQS queue.

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
| this_sqs_queue_arn | The ARN of the SQS queue |
| this_sqs_queue_id | The URL for the created Amazon SQS queue |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
