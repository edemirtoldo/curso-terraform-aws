# https://developer.hashicorp.com/terraform/cli/commands

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      "Project"    = "Curso AWS com Terraform"
      "Module"     = "Terraform CLI"
      "CreatedAt"  = "2023-11-13"
      "ManagedBy"  = "Terraform"
      "Owner"      = "Cleber Gasparoto"
      "Repository" = "github.com/cleber-gasparoto-org/curso-terraform-aws-3s"
    }
  }
}

resource "random_pet" "this" {
  count = 3

  length = 5
}
