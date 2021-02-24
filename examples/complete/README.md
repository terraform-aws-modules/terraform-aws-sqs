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
| terraform | >= 0.12.7 |
| aws | >= 2.30 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.30 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| users_encrypted | ../../ |  |
| users_unencrypted | ../../ |  |

## Resources

| Name |
|------|
| [aws_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) |

## Inputs

No input.

## Outputs

| Name | Description |
|------|-------------|
| users\_encrypted\_this\_sqs\_queue\_arn | The ARN of the SQS queue |
| users\_encrypted\_this\_sqs\_queue\_id | The URL for the created Amazon SQS queue |
| users\_unencrypted\_this\_sqs\_queue\_arn | The ARN of the SQS queue |
| users\_unencrypted\_this\_sqs\_queue\_id | The URL for the created Amazon SQS queue |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
