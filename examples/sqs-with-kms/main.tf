provider "aws" {
  region = "eu-west-1"
}

module "users_queue" {
  source = "../../"

  name = "users-encrypted"

  kms_master_key_id = "arn:aws:kms:eu-west-1:000014191260:key/66db1c5d-d42b-4e28-8efb-07a9cf607a73"

  tags = {
    Project    = "secret"
    Department = "kingdom"
    Secure     = "true"
  }
}
