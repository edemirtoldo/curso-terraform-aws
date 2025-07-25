# https://developer.hashicorp.com/terraform/language/settings/backends/s3

provider "aws" {
  region  = "us-east-1"
  profile = "tf_thinkpad_edemirtoldo"

  default_tags {
    tags = {
      "Project"    = "Curso AWS com Terraform"
      "Module"     = "Remote State"
      "Component"  = "Backend bucket"
      "CreatedAt"  = "2025-07-24"
      "ManagedBy"  = "Terraform"
      "Owner"      = "Edemir Toldo"
      "Repository" = "github.com/edemirtoldo/curso-terraform-aws"
    }
  }
}
