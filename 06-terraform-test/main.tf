# https://www.hashicorp.com/blog/terraform-1-6-adds-a-test-framework-for-enhanced-code-validation
# https://developer.hashicorp.com/terraform/language/tests
# https://developer.hashicorp.com/terraform/cli/test
# https://developer.hashicorp.com/terraform/tutorials/configuration-language/test

provider "aws" {
  region = var.aws_region
  profile = "tf_thinkpad_edemirtoldo"

  default_tags {
    tags = {
      "Project"    = "Curso AWS com Terraform"
      "Module"     = "Terraform Test"
      "CreatedAt"  = "2025-07-28"
      "ManagedBy"  = "Terraform"
      "Owner"      = "Edemir Toldo"
      "Repository" = "github.com/edemirtoldo/curso-terraform-aws"
    }
  }
}
