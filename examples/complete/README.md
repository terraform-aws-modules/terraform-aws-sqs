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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.30 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.30 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_users_encrypted"></a> [users\_encrypted](#module\_users\_encrypted) | ../../ |  |
| <a name="module_users_unencrypted"></a> [users\_unencrypted](#module\_users\_unencrypted) | ../../ |  |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_sqs_queue_policy.users_unencrypted_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sqs_queue_policy) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_users_encrypted_sqs_queue_arn"></a> [users\_encrypted\_sqs\_queue\_arn](#output\_users\_encrypted\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_users_encrypted_sqs_queue_id"></a> [users\_encrypted\_sqs\_queue\_id](#output\_users\_encrypted\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
| <a name="output_users_unencrypted_sqs_queue_arn"></a> [users\_unencrypted\_sqs\_queue\_arn](#output\_users\_unencrypted\_sqs\_queue\_arn) | The ARN of the SQS queue |
| <a name="output_users_unencrypted_sqs_queue_id"></a> [users\_unencrypted\_sqs\_queue\_id](#output\_users\_unencrypted\_sqs\_queue\_id) | The URL for the created Amazon SQS queue |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
