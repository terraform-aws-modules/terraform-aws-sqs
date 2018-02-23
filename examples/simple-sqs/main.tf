provider "aws" {
  region = "eu-west-1"
}

module "users_queue" {
  source = "../../"

  name = "users"

  tags = {
    Project    = "secret"
    Department = "kingdom"
  }
}

# This queue should not be created
module "users_queue_disabled" {
  source = "../../"

  name = "users"

  create = false

  tags = {
    Project    = "secret"
    Department = "kingdom"
  }
}
