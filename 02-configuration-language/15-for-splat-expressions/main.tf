# https://developer.hashicorp.com/terraform/language/expressions/for

provider "aws" {
  region  = "us-east-1"
  profile = "tf_thinkpad_edemirtoldo"

  default_tags {
    tags = {
      "Project"    = "Curso AWS com Terraform"
      "Module"     = "Configuration Language"
      "Component"  = "for and splat expressions"
      "CreatedAt"  = "2025-07-24"
      "ManagedBy"  = "Terraform"
      "Owner"      = "Edemir Toldo"
      "Repository" = "github.com/edemirtoldo/curso-terraform-aws"
    }
  }
}
