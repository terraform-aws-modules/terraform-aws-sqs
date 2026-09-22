mock_provider "aws" {
  mock_data "aws_caller_identity" {
    defaults = {
      account_id = "123456789012"
    }
  }

  mock_data "aws_partition" {
    defaults = {
      dns_suffix = "amazonaws.com"
      partition  = "aws"
    }
  }

  mock_data "aws_region" {
    defaults = {
      region = "eu-west-1"
    }
  }

  mock_data "aws_iam_role" {
    defaults = {
      arn  = "arn:aws:iam::123456789012:role/application"
      name = "application"
    }
  }

  mock_data "aws_kms_key" {
    defaults = {
      arn = "arn:aws:kms:eu-west-1:123456789012:key/1234abcd-12ab-34cd-8abc-1234567890ab"
    }
  }

  mock_resource "aws_sqs_queue" {
    defaults = {
      arn  = "arn:aws:sqs:eu-west-1:123456789012:orders"
      id   = "https://sqs.eu-west-1.amazonaws.com/123456789012/orders"
      name = "orders"
      url  = "https://sqs.eu-west-1.amazonaws.com/123456789012/orders"
    }
  }
}

run "keeps_existing_behaviour_without_queue_access_roles" {
  command = apply

  variables {
    name = "orders"
  }

  assert {
    condition     = length(aws_iam_role_policy.queue_access) == 0
    error_message = "No IAM policy must be created when no queue access role ARN is provided."
  }

  assert {
    condition     = output.queue_access_policy_names == {}
    error_message = "The policy name output must be empty when no queue access role ARN is provided."
  }
}

run "allows_an_existing_role_to_produce_messages" {
  command = apply

  variables {
    name              = "orders"
    producer_role_arn = "arn:aws:iam::123456789012:role/application"
  }

  assert {
    condition     = length(aws_iam_role_policy.queue_access) == 1
    error_message = "A producer role ARN must create one inline policy."
  }

  assert {
    condition     = aws_iam_role_policy.queue_access["arn:aws:iam::123456789012:role/application"].role == "application"
    error_message = "The inline policy must be attached to the existing producer role."
  }

  assert {
    condition = jsondecode(aws_iam_role_policy.queue_access["arn:aws:iam::123456789012:role/application"].policy).Statement[0] == {
      Action   = ["sqs:GetQueueUrl", "sqs:SendMessage", "sqs:SendMessageBatch"]
      Effect   = "Allow"
      Resource = "arn:aws:sqs:eu-west-1:123456789012:orders"
      Sid      = "ProduceMessages"
    }
    error_message = "The producer policy must allow only the expected actions on the main queue."
  }

  assert {
    condition     = length(jsondecode(aws_iam_role_policy.queue_access["arn:aws:iam::123456789012:role/application"].policy).Statement) == 1
    error_message = "SQS-managed encryption must not add KMS permissions."
  }
}

run "allows_an_existing_role_to_consume_messages" {
  command = apply

  variables {
    name              = "orders"
    consumer_role_arn = "arn:aws:iam::123456789012:role/application"
  }

  assert {
    condition = jsondecode(aws_iam_role_policy.queue_access["arn:aws:iam::123456789012:role/application"].policy).Statement[0] == {
      Action = [
        "sqs:ChangeMessageVisibility",
        "sqs:ChangeMessageVisibilityBatch",
        "sqs:DeleteMessage",
        "sqs:DeleteMessageBatch",
        "sqs:GetQueueAttributes",
        "sqs:GetQueueUrl",
        "sqs:ReceiveMessage",
      ]
      Effect   = "Allow"
      Resource = "arn:aws:sqs:eu-west-1:123456789012:orders"
      Sid      = "ConsumeMessages"
    }
    error_message = "The consumer policy must allow only the expected actions on the main queue."
  }
}

run "combines_producer_and_consumer_access_for_the_same_role" {
  command = apply

  variables {
    name              = "orders"
    producer_role_arn = "arn:aws:iam::123456789012:role/application"
    consumer_role_arn = "arn:aws:iam::123456789012:role/application"
  }

  assert {
    condition     = length(aws_iam_role_policy.queue_access) == 1
    error_message = "The same producer and consumer role must receive one combined inline policy."
  }

  assert {
    condition     = length(jsondecode(aws_iam_role_policy.queue_access["arn:aws:iam::123456789012:role/application"].policy).Statement) == 2
    error_message = "The combined policy must contain producer and consumer permissions."
  }

  assert {
    condition     = output.queue_access_policy_names["arn:aws:iam::123456789012:role/application"] == aws_iam_role_policy.queue_access["arn:aws:iam::123456789012:role/application"].name
    error_message = "The policy name output must be indexed by the existing role ARN."
  }
}

run "creates_one_policy_for_each_distinct_role" {
  command = apply

  override_data {
    target = data.aws_iam_role.queue_access["arn:aws:iam::123456789012:role/producer"]
    values = {
      arn  = "arn:aws:iam::123456789012:role/producer"
      name = "producer"
    }
  }

  override_data {
    target = data.aws_iam_role.queue_access["arn:aws:iam::123456789012:role/consumer"]
    values = {
      arn  = "arn:aws:iam::123456789012:role/consumer"
      name = "consumer"
    }
  }

  variables {
    name              = "orders"
    producer_role_arn = "arn:aws:iam::123456789012:role/producer"
    consumer_role_arn = "arn:aws:iam::123456789012:role/consumer"
  }

  assert {
    condition     = length(aws_iam_role_policy.queue_access) == 2
    error_message = "Distinct producer and consumer roles must receive distinct inline policies."
  }

  assert {
    condition     = aws_iam_role_policy.queue_access["arn:aws:iam::123456789012:role/producer"].role == "producer"
    error_message = "The producer policy must be attached to the existing producer role."
  }

  assert {
    condition     = aws_iam_role_policy.queue_access["arn:aws:iam::123456789012:role/consumer"].role == "consumer"
    error_message = "The consumer policy must be attached to the existing consumer role."
  }
}

run "grants_kms_permissions_only_for_the_main_queue" {
  command = apply

  override_resource {
    target = aws_sqs_queue.dlq[0]
    values = {
      arn  = "arn:aws:sqs:eu-west-1:123456789012:orders-dlq"
      id   = "https://sqs.eu-west-1.amazonaws.com/123456789012/orders-dlq"
      name = "orders-dlq"
      url  = "https://sqs.eu-west-1.amazonaws.com/123456789012/orders-dlq"
    }
  }

  variables {
    name              = "orders"
    producer_role_arn = "arn:aws:iam::123456789012:role/application"
    consumer_role_arn = "arn:aws:iam::123456789012:role/application"
    kms_master_key_id = "arn:aws:kms:eu-west-1:123456789012:key/1234abcd-12ab-34cd-8abc-1234567890ab"
    create_dlq        = true
  }

  assert {
    condition = jsondecode(aws_iam_role_policy.queue_access["arn:aws:iam::123456789012:role/application"].policy).Statement[2] == {
      Action = ["kms:Decrypt", "kms:GenerateDataKey"]
      Condition = {
        StringEquals = {
          "kms:EncryptionContext:aws:sqs:arn" = "arn:aws:sqs:eu-west-1:123456789012:orders"
          "kms:ViaService"                    = "sqs.eu-west-1.amazonaws.com"
        }
      }
      Effect   = "Allow"
      Resource = "arn:aws:kms:eu-west-1:123456789012:key/1234abcd-12ab-34cd-8abc-1234567890ab"
      Sid      = "UseQueueKmsKey"
    }
    error_message = "KMS permissions must be limited to SQS and the exact main queue."
  }

  assert {
    condition = alltrue([
      for statement in jsondecode(aws_iam_role_policy.queue_access["arn:aws:iam::123456789012:role/application"].policy).Statement :
      statement.Resource != aws_sqs_queue.dlq[0].arn
    ])
    error_message = "Queue access roles must not receive permissions on the dead letter queue."
  }
}

run "grants_only_kms_decrypt_to_a_consumer" {
  command = apply

  variables {
    name              = "orders"
    consumer_role_arn = "arn:aws:iam::123456789012:role/application"
    kms_master_key_id = "arn:aws:kms:eu-west-1:123456789012:key/1234abcd-12ab-34cd-8abc-1234567890ab"
  }

  assert {
    condition     = jsondecode(aws_iam_role_policy.queue_access["arn:aws:iam::123456789012:role/application"].policy).Statement[1].Action == ["kms:Decrypt"]
    error_message = "A consumer must receive only KMS decrypt permission."
  }
}

run "rejects_queue_access_roles_when_no_queue_is_created" {
  command = plan

  variables {
    create            = false
    name              = "orders"
    producer_role_arn = "arn:aws:iam::123456789012:role/application"
  }

  expect_failures = [aws_iam_role_policy.queue_access]
}

run "rejects_a_queue_access_role_from_another_aws_account" {
  command = plan

  variables {
    name              = "orders"
    producer_role_arn = "arn:aws:iam::999999999999:role/application"
  }

  expect_failures = [aws_iam_role_policy.queue_access]
}

run "rejects_a_role_arn_that_does_not_match_the_existing_role" {
  command = plan

  variables {
    name              = "orders"
    producer_role_arn = "arn:aws:iam::123456789012:role/team/application"
  }

  expect_failures = [aws_iam_role_policy.queue_access]
}

run "rejects_invalid_queue_access_role_arns" {
  command = plan

  variables {
    name              = "orders"
    producer_role_arn = "application"
    consumer_role_arn = "consumer"
  }

  expect_failures = [var.producer_role_arn, var.consumer_role_arn]
}
