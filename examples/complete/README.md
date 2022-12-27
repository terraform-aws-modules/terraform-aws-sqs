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
| <a name="module_cmk_encrypted_sqs"></a> [cmk\_encrypted\_sqs](#module\_cmk\_encrypted\_sqs) | ../../ | n/a |
| <a name="module_default_sqs"></a> [default\_sqs](#module\_default\_sqs) | ../../ | n/a |
| <a name="module_disabled_sqs"></a> [disabled\_sqs](#module\_disabled\_sqs) | ../../ | n/a |
| <a name="module_fifo_sqs"></a> [fifo\_sqs](#module\_fifo\_sqs) | ../../ | n/a |
| <a name="module_sqs_with_dlq"></a> [sqs\_with\_dlq](#module\_sqs\_with\_dlq) | ../../ | n/a |
| <a name="module_sse_encrypted_dlq_sqs"></a> [sse\_encrypted\_dlq\_sqs](#module\_sse\_encrypted\_dlq\_sqs) | ../../ | n/a |
| <a name="module_sse_encrypted_sqs"></a> [sse\_encrypted\_sqs](#module\_sse\_encrypted\_sqs) | ../../ | n/a |
| <a name="module_unencrypted_sqs"></a> [unencrypted\_sqs](#module\_unencrypted\_sqs) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cmk_encrypted_sqs_dlq_arn"></a> [cmk\_encrypted\_sqs\_dlq\_arn](#output\_cmk\_encrypted\_sqs\_dlq\_arn) | The ARN of the SQS queue |
| <a name="output_cmk_encrypted_sqs_dlq_id"></a> [cmk\_encrypted\_sqs\_dlq\_id](#output\_cmk\_encrypted\_sqs\_dlq\_id) | The URL for the created Amazon SQS queue |
| <a name="output_cmk_encrypted_sqs_dlq_name"></a> [cmk\_encrypted\_sqs\_dlq\_name](#output\_cmk\_encrypted\_sqs\_dlq\_name) | The name of the SQS queue |
| <a name="output_cmk_encrypted_sqs_dlq_url"></a> [cmk\_encrypted\_sqs\_dlq\_url](#output\_cmk\_encrypted\_sqs\_dlq\_url) | Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_cmk_encrypted_sqs_queue_arn"></a> [cmk\_encrypted\_sqs\_queue\_arn](#output\_cmk\_encrypted\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_cmk_encrypted_sqs_queue_id"></a> [cmk\_encrypted\_sqs\_queue\_id](#output\_cmk\_encrypted\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_cmk_encrypted_sqs_queue_name"></a> [cmk\_encrypted\_sqs\_queue\_name](#output\_cmk\_encrypted\_sqs\_queue\_name) | The name of the SQS queue |
| <a name="output_cmk_encrypted_sqs_queue_url"></a> [cmk\_encrypted\_sqs\_queue\_url](#output\_cmk\_encrypted\_sqs\_queue\_url) | Same as `queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_default_sqs_dlq_arn"></a> [default\_sqs\_dlq\_arn](#output\_default\_sqs\_dlq\_arn) | The ARN of the SQS queue |
| <a name="output_default_sqs_dlq_id"></a> [default\_sqs\_dlq\_id](#output\_default\_sqs\_dlq\_id) | The URL for the created Amazon SQS queue |
| <a name="output_default_sqs_dlq_name"></a> [default\_sqs\_dlq\_name](#output\_default\_sqs\_dlq\_name) | The name of the SQS queue |
| <a name="output_default_sqs_dlq_url"></a> [default\_sqs\_dlq\_url](#output\_default\_sqs\_dlq\_url) | Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_default_sqs_queue_arn"></a> [default\_sqs\_queue\_arn](#output\_default\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_default_sqs_queue_id"></a> [default\_sqs\_queue\_id](#output\_default\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_default_sqs_queue_name"></a> [default\_sqs\_queue\_name](#output\_default\_sqs\_queue\_name) | The name of the SQS queue |
| <a name="output_default_sqs_queue_url"></a> [default\_sqs\_queue\_url](#output\_default\_sqs\_queue\_url) | Same as `queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_disabled_sqs_dlq_arn"></a> [disabled\_sqs\_dlq\_arn](#output\_disabled\_sqs\_dlq\_arn) | The ARN of the SQS queue |
| <a name="output_disabled_sqs_dlq_id"></a> [disabled\_sqs\_dlq\_id](#output\_disabled\_sqs\_dlq\_id) | The URL for the created Amazon SQS queue |
| <a name="output_disabled_sqs_dlq_name"></a> [disabled\_sqs\_dlq\_name](#output\_disabled\_sqs\_dlq\_name) | The name of the SQS queue |
| <a name="output_disabled_sqs_dlq_url"></a> [disabled\_sqs\_dlq\_url](#output\_disabled\_sqs\_dlq\_url) | Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_disabled_sqs_queue_arn"></a> [disabled\_sqs\_queue\_arn](#output\_disabled\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_disabled_sqs_queue_id"></a> [disabled\_sqs\_queue\_id](#output\_disabled\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_disabled_sqs_queue_name"></a> [disabled\_sqs\_queue\_name](#output\_disabled\_sqs\_queue\_name) | The name of the SQS queue |
| <a name="output_disabled_sqs_queue_url"></a> [disabled\_sqs\_queue\_url](#output\_disabled\_sqs\_queue\_url) | Same as `queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_fifo_sqs_dlq_arn"></a> [fifo\_sqs\_dlq\_arn](#output\_fifo\_sqs\_dlq\_arn) | The ARN of the SQS queue |
| <a name="output_fifo_sqs_dlq_id"></a> [fifo\_sqs\_dlq\_id](#output\_fifo\_sqs\_dlq\_id) | The URL for the created Amazon SQS queue |
| <a name="output_fifo_sqs_dlq_name"></a> [fifo\_sqs\_dlq\_name](#output\_fifo\_sqs\_dlq\_name) | The name of the SQS queue |
| <a name="output_fifo_sqs_dlq_url"></a> [fifo\_sqs\_dlq\_url](#output\_fifo\_sqs\_dlq\_url) | Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_fifo_sqs_queue_arn"></a> [fifo\_sqs\_queue\_arn](#output\_fifo\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_fifo_sqs_queue_id"></a> [fifo\_sqs\_queue\_id](#output\_fifo\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_fifo_sqs_queue_name"></a> [fifo\_sqs\_queue\_name](#output\_fifo\_sqs\_queue\_name) | The name of the SQS queue |
| <a name="output_fifo_sqs_queue_url"></a> [fifo\_sqs\_queue\_url](#output\_fifo\_sqs\_queue\_url) | Same as `queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_sqs_with_dlq_dlq_arn"></a> [sqs\_with\_dlq\_dlq\_arn](#output\_sqs\_with\_dlq\_dlq\_arn) | The ARN of the SQS queue |
| <a name="output_sqs_with_dlq_dlq_id"></a> [sqs\_with\_dlq\_dlq\_id](#output\_sqs\_with\_dlq\_dlq\_id) | The URL for the created Amazon SQS queue |
| <a name="output_sqs_with_dlq_dlq_name"></a> [sqs\_with\_dlq\_dlq\_name](#output\_sqs\_with\_dlq\_dlq\_name) | The name of the SQS queue |
| <a name="output_sqs_with_dlq_dlq_url"></a> [sqs\_with\_dlq\_dlq\_url](#output\_sqs\_with\_dlq\_dlq\_url) | Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_sqs_with_dlq_queue_arn"></a> [sqs\_with\_dlq\_queue\_arn](#output\_sqs\_with\_dlq\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_sqs_with_dlq_queue_id"></a> [sqs\_with\_dlq\_queue\_id](#output\_sqs\_with\_dlq\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_sqs_with_dlq_queue_name"></a> [sqs\_with\_dlq\_queue\_name](#output\_sqs\_with\_dlq\_queue\_name) | The name of the SQS queue |
| <a name="output_sqs_with_dlq_queue_url"></a> [sqs\_with\_dlq\_queue\_url](#output\_sqs\_with\_dlq\_queue\_url) | Same as `queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_sse_encrypted_dlq_sqs_dlq_arn"></a> [sse\_encrypted\_dlq\_sqs\_dlq\_arn](#output\_sse\_encrypted\_dlq\_sqs\_dlq\_arn) | The ARN of the SQS queue |
| <a name="output_sse_encrypted_dlq_sqs_dlq_id"></a> [sse\_encrypted\_dlq\_sqs\_dlq\_id](#output\_sse\_encrypted\_dlq\_sqs\_dlq\_id) | The URL for the created Amazon SQS queue |
| <a name="output_sse_encrypted_dlq_sqs_dlq_name"></a> [sse\_encrypted\_dlq\_sqs\_dlq\_name](#output\_sse\_encrypted\_dlq\_sqs\_dlq\_name) | The name of the SQS queue |
| <a name="output_sse_encrypted_dlq_sqs_dlq_url"></a> [sse\_encrypted\_dlq\_sqs\_dlq\_url](#output\_sse\_encrypted\_dlq\_sqs\_dlq\_url) | Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_sse_encrypted_dlq_sqs_queue_arn"></a> [sse\_encrypted\_dlq\_sqs\_queue\_arn](#output\_sse\_encrypted\_dlq\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_sse_encrypted_dlq_sqs_queue_id"></a> [sse\_encrypted\_dlq\_sqs\_queue\_id](#output\_sse\_encrypted\_dlq\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_sse_encrypted_dlq_sqs_queue_name"></a> [sse\_encrypted\_dlq\_sqs\_queue\_name](#output\_sse\_encrypted\_dlq\_sqs\_queue\_name) | The name of the SQS queue |
| <a name="output_sse_encrypted_dlq_sqs_queue_url"></a> [sse\_encrypted\_dlq\_sqs\_queue\_url](#output\_sse\_encrypted\_dlq\_sqs\_queue\_url) | Same as `queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_sse_encrypted_sqs_dlq_arn"></a> [sse\_encrypted\_sqs\_dlq\_arn](#output\_sse\_encrypted\_sqs\_dlq\_arn) | The ARN of the SQS queue |
| <a name="output_sse_encrypted_sqs_dlq_id"></a> [sse\_encrypted\_sqs\_dlq\_id](#output\_sse\_encrypted\_sqs\_dlq\_id) | The URL for the created Amazon SQS queue |
| <a name="output_sse_encrypted_sqs_dlq_name"></a> [sse\_encrypted\_sqs\_dlq\_name](#output\_sse\_encrypted\_sqs\_dlq\_name) | The name of the SQS queue |
| <a name="output_sse_encrypted_sqs_dlq_url"></a> [sse\_encrypted\_sqs\_dlq\_url](#output\_sse\_encrypted\_sqs\_dlq\_url) | Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_sse_encrypted_sqs_queue_arn"></a> [sse\_encrypted\_sqs\_queue\_arn](#output\_sse\_encrypted\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_sse_encrypted_sqs_queue_id"></a> [sse\_encrypted\_sqs\_queue\_id](#output\_sse\_encrypted\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_sse_encrypted_sqs_queue_name"></a> [sse\_encrypted\_sqs\_queue\_name](#output\_sse\_encrypted\_sqs\_queue\_name) | The name of the SQS queue |
| <a name="output_sse_encrypted_sqs_queue_url"></a> [sse\_encrypted\_sqs\_queue\_url](#output\_sse\_encrypted\_sqs\_queue\_url) | Same as `queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_unencrypted_sqs_dlq_arn"></a> [unencrypted\_sqs\_dlq\_arn](#output\_unencrypted\_sqs\_dlq\_arn) | The ARN of the SQS queue |
| <a name="output_unencrypted_sqs_dlq_id"></a> [unencrypted\_sqs\_dlq\_id](#output\_unencrypted\_sqs\_dlq\_id) | The URL for the created Amazon SQS queue |
| <a name="output_unencrypted_sqs_dlq_name"></a> [unencrypted\_sqs\_dlq\_name](#output\_unencrypted\_sqs\_dlq\_name) | The name of the SQS queue |
| <a name="output_unencrypted_sqs_dlq_url"></a> [unencrypted\_sqs\_dlq\_url](#output\_unencrypted\_sqs\_dlq\_url) | Same as `dead_letter_queue_id`: The URL for the created Amazon SQS queue |
| <a name="output_unencrypted_sqs_queue_arn"></a> [unencrypted\_sqs\_queue\_arn](#output\_unencrypted\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_unencrypted_sqs_queue_id"></a> [unencrypted\_sqs\_queue\_id](#output\_unencrypted\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_unencrypted_sqs_queue_name"></a> [unencrypted\_sqs\_queue\_name](#output\_unencrypted\_sqs\_queue\_name) | The name of the SQS queue |
| <a name="output_unencrypted_sqs_queue_url"></a> [unencrypted\_sqs\_queue\_url](#output\_unencrypted\_sqs\_queue\_url) | Same as `queue_id`: The URL for the created Amazon SQS queue |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
