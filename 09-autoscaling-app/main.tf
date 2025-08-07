provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      "Project"    = "Curso AWS com Terraform"
      "Module"     = "Auto Scaling App"
      "CreateAt"   = "2025-08-07"
      "ManagedBy"  = "Terraform"
      "Owner"      = "Edemir Toldo"
      "Repository" = "github.com/edemirtoldo/curso-terraform-aws"
    }
  }
}
