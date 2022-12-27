# Complete SQS queues example

Configuration in this directory creates 2 SQS queues - with server-side encryption (SSE) using specified KMS key and without SSE.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cmk_encrypted"></a> [cmk\_encrypted](#module\_cmk\_encrypted) | ../../ | n/a |
| <a name="module_default"></a> [default](#module\_default) | ../../ | n/a |
| <a name="module_dlq_redrive"></a> [dlq\_redrive](#module\_dlq\_redrive) | ../../ | n/a |
| <a name="module_sse_encrypted"></a> [sse\_encrypted](#module\_sse\_encrypted) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_sqs_queue_policy.users_unencrypted_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cmk_sqs_queue_name"></a> [cmk\_sqs\_queue\_name](#output\_cmk\_sqs\_queue\_name) | The name of the SQS queue |
| <a name="output_cmk_unencrypted_sqs_queue_arn"></a> [cmk\_unencrypted\_sqs\_queue\_arn](#output\_cmk\_unencrypted\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_cmk_unencrypted_sqs_queue_id"></a> [cmk\_unencrypted\_sqs\_queue\_id](#output\_cmk\_unencrypted\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_default_sqs_queue_arn"></a> [default\_sqs\_queue\_arn](#output\_default\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_default_sqs_queue_id"></a> [default\_sqs\_queue\_id](#output\_default\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_default_sqs_queue_name"></a> [default\_sqs\_queue\_name](#output\_default\_sqs\_queue\_name) | The name of the SQS queue |
| <a name="output_dlq_redrive_sqs_queue_arn"></a> [dlq\_redrive\_sqs\_queue\_arn](#output\_dlq\_redrive\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_dlq_redrive_sqs_queue_id"></a> [dlq\_redrive\_sqs\_queue\_id](#output\_dlq\_redrive\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_dlq_redrive_sqs_queue_name"></a> [dlq\_redrive\_sqs\_queue\_name](#output\_dlq\_redrive\_sqs\_queue\_name) | The name of the SQS queue |
| <a name="output_sse_encrypted_sqs_queue_arn"></a> [sse\_encrypted\_sqs\_queue\_arn](#output\_sse\_encrypted\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_sse_encrypted_sqs_queue_id"></a> [sse\_encrypted\_sqs\_queue\_id](#output\_sse\_encrypted\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_sse_encrypted_sqs_queue_name"></a> [sse\_encrypted\_sqs\_queue\_name](#output\_sse\_encrypted\_sqs\_queue\_name) | The name of the SQS queue |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
