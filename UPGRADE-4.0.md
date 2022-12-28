# Upgrade from v3.x to v4.x

If you have any questions regarding this upgrade process, please consult the [`examples`](https://github.com/terraform-aws-modules/terraform-aws-sns/tree/master/examples/complete) directory:

If you find a bug, please open an issue with supporting configuration to reproduce.

## List of backwards incompatible changes

- `var.redrive_policy`, and `var.redrive_policy` data types have changed from `string` to `any` which is a map of values. The conversion from a map to a jsonencoded string is now handled by the module
- `var.name_prefix` has been replaced with `var.use_name_prefix` which is a boolean that will use `var.name` as a prefix
- `var.policy` has been removed; users can create a policy via the queue policy or dead-letter queue policy which by default uses the associated queue ARN as the `resource` (avoids the chicken vs the egg scenario)

## Additional changes

### Added

- When creating a FIFO queue, the `.fifo` postfix will now be automatically added to the queue name
- Added support for creating:
  - Queue policy
  - Dead letter queue
  - Dead letter queue policy
- Redrive and redrive allow policies have been converted to their separate resources to avoid lifecycle conflicts; now you can create both the source queue and dead-letter queue in the same `terraform apply` without conflict
- The queue data source previously used to extract the queue name has been replaced since this is natively supported in the current AWS provider queue resource

### Modified

- `visibility_timeout_seconds` default value has been changed from `30` to `null`
- `message_retention_seconds` default value has been changed from `345600` to `null`
- `max_message_size` default value has been changed from `262144` to `null`
- `delay_seconds` default value has been changed from `0` to `null`
- `receive_wait_time_seconds` default value has been changed from `0` to `null`
- `content_based_deduplication` default value has been changed from `false` to `null`
- `sqs_managed_sse_enabled` default value has been changed from `false` to `true` (matches current default behavior but value is needed for internal logic evaluation)
- `kms_data_key_reuse_period_seconds` default value has been changed from `300` to `null`

### Variable and output changes

1. Removed variables:

    - `name_prefix` has been replaced with `use_name_prefix` which is a boolean that will use `name` as a prefix
    - `policy` has been removed; users can create a policy via the queue policy or dead-letter queue policy which by default uses the associated queue ARN as the `resource` (avoids the chicken vs the egg scenario)

2. Renamed variables:

    - None

3. Added variables:

    - `use_name_prefix`
    - `create_queue_policy`
    - `source_queue_policy_documents`
    - `override_queue_policy_documents`
    - `queue_policy_statements`
    - `create_dlq`
    - `dlq_content_based_deduplication`
    - `dlq_deduplication_scope`
    - `dlq_delay_seconds`
    - `dlq_kms_data_key_reuse_period_seconds`
    - `dlq_kms_master_key_id`
    - `dlq_message_retention_seconds`
    - `dlq_name`
    - `dlq_receive_wait_time_seconds`
    - `dlq_redrive_allow_policy`
    - `dlq_sqs_managed_sse_enabled`
    - `dlq_visibility_timeout_seconds`
    - `dlq_tags`
    - `create_dlq_queue_policy`
    - `source_dlq_queue_policy_documents`
    - `override_dlq_queue_policy_documents`
    - `dlq_queue_policy_statements`

4. Removed outputs:

    - None

5. Renamed outputs:

    - All output names have had the `sqs_` prefix removed

6. Added outputs:

    - `queue_url`
    - `dead_letter_queue_id`
    - `dead_letter_queue_arn`
    - `dead_letter_queue_url`
    - `dead_letter_queue_name`

## Upgrade Migrations

Note: Only the affected attributes are shown below for brevity.

### Before 3.x Example

```hcl
module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "~> 3.0"

  name_prefix = "example-"

  redrive_policy       = jsonencoded({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.example.arn]
  })
  redrive_allow_policy = jsonencoded({
    deadLetterTargetArn = aws_sqs_queue.example.arn
    maxReceiveCount     = 4
  })

  policy = "..."
}
```

### After 4.x Example

```hcl
module "sqs" {
  source  = "terraform-aws-modules/sns/aws"
  version = "~> 4.0"

  name            = "example"
  use_name_prefix = true

  redrive_policy       = {
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.example.arn]
  }
  redrive_allow_policy = {
    deadLetterTargetArn = aws_sqs_queue.example.arn
    maxReceiveCount     = 4
  }

  # Can be used to utilize v3.x `var.policy` value without modification
  # source_queue_policy_documents = ["..."]
}
```

### State Changes

No state changes required.
