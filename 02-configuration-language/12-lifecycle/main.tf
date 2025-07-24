# https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle

provider "aws" {
  region  = "us-east-1"
  profile = "tf_thinkpad_edemirtoldo"

  default_tags {
    tags = {
      "Project"    = "Curso AWS com Terraform"
      "Module"     = "Configuration Language"
      "Component"  = "Meta-Argument: Lifecycle"
      "CreatedAt"  = "2025-07-24"
      "ManagedBy"  = "Terraform"
      "Owner"      = "Edemir Toldo"
      "Repository" = "github.com/edemirtoldo/curso-terraform-aws"
    }
  }
}

resource "random_pet" "this" {
  length = 5
}
