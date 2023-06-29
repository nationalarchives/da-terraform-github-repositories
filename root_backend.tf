terraform {
  backend "s3" {
    bucket         = "mgmt-dp-terraform-state"
    key            = "terraform.da.github.state"
    region         = "eu-west-2"
    dynamodb_table = "mgmt-da-terraform-state-lock"
  }
}
