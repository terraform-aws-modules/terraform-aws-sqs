provider "aws" {
  region = "eu-west-1"
}

resource "aws_kms_key" "this" {}

module "users_queue_with_kms_static" {
  source = "../../"

  name = "users-encrypted-with-kms-static"

  sqs_queue_with_kms = true
  kms_master_key_id  = "arn:aws:kms:eu-west-1:000014191260:key/66db1c5d-d42b-4e28-8efb-07a9cf607a73"

  tags = {
    Project    = "secret"
    Department = "kingdom"
    Secure     = "true"
  }
}

module "users_queue_with_kms_dynamic" {
  source = "../../"

  name = "users-encrypted-with-kms-dynamic"

  sqs_queue_with_kms = true
  kms_master_key_id  = "${aws_kms_key.this.id}"

  tags = {
    Project    = "secret"
    Department = "kingdom"
    Secure     = "true"
  }
}
