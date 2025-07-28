# https://developer.hashicorp.com/terraform/cli/commands

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      "Project"    = "Curso AWS com Terraform"
      "Module"     = "Terraform CLI"
      "CreatedAt"  = "2025-07-28"
      "ManagedBy"  = "Terraform"
      "Owner"      = "Edemir Toldo"
      "Repository" = "github.com/edemirtoldo/curso-terraform-aws"
    }
  }
}

resource "random_pet" "this" {
  count = 3

  length = 5
}
