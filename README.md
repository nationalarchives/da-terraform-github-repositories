# DA Terraform GitHub repositories

This repository is used to create new repositories in the Digital Archiving namespace. These will typically be used by multiple teams.

## State file bucket and lock table
Terraform needs a bucket to hold the state file and a dynamo table for the lock key. This will be store in the dp-management account as there is no cross department AWS account yet.

## Slack notifications
Slack notifications on deploy go to the da-new-preservation-system-notifications Slack channel. This can be changed by updating the SLACK_WEBHOOK secret. 

## Create a new repository
Add a new module in the `root.tf` file

```terraform
module "github_da_example_repository" {
  source          = "git::https://github.com/nationalarchives/tdr-terraform-modules//github_repositories"
  repository_name = "nationalarchives/da-example-repository"
  secrets = {
    "ACTIONS_SECRET_NAME" : data.aws_ssm_parameter.actions_secret.value
  }
}

```
Raise a pull request to merge to the main branch.

On merge to main, GitHub actions will run terraform to create the new repository.
