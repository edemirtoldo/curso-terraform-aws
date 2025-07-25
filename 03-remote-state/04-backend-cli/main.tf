# https://developer.hashicorp.com/terraform/language/settings/backends/configuration#command-line-key-value-pairs

provider "aws" {
  region  = "us-east-1"
  profile = "tf_thinkpad_edemirtoldo"

  default_tags {
    tags = {
      "Project"    = "Curso AWS com Terraform"
      "Module"     = "Remote State"
      "Component"  = "Backend CLI configuration"
      "CreatedAt"  = "2025-07-25"
      "ManagedBy"  = "Terraform"
      "Owner"      = "Edemir Toldo"
      "Repository" = "github.com/edemirtoldo/curso-terraform-aws"
    }
  }
}

resource "random_pet" "this" {
  length = 5
}
