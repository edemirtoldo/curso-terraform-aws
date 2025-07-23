# https://developer.hashicorp.com/terraform/language/modules

provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      "Project"    = "Curso AWS com Terraform"
      "Module"     = "Modules"
      "Component"  = "Consuming modules"
      "CreatedAt"  = "2023-11-14"
      "ManagedBy"  = "Terraform"
      "Owner"      = "Cleber Gasparoto"
      "Repository" = "github.com/cleber-gasparoto-org/curso-terraform-aws-3s"
    }
  }
}

resource "random_pet" "this" {
  length = 3
}
