# https://developer.hashicorp.com/terraform/language/modules

provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      "Project"    = "Curso AWS com Terraform"
      "Module"     = "Modules"
      "Component"  = "Consuming modules"
      "CreatedAt"  = "2025-07-28"
      "ManagedBy"  = "Terraform"
      "Owner"      = "Edemir Toldo"
      "Repository" = "github.com/edemirtoldo/curso-terraform-aws"
    }
  }
}

resource "random_pet" "this" {
  length = 3
}
