provider "aws" {
  region = "eu-west-1"
}

module "users_queue" {
  source = "../../"

  name        = "users"

  tags = {
    Project    = "secret"
    Department = "kingdom"
  }

}
