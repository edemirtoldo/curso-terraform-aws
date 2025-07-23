# https://developer.hashicorp.com/terraform/language/values/outputs

provider "aws" {
  region  = "us-east-1"
  profile = "tf_thinkpad_edemirtoldo"

  default_tags {
    tags = {
      "Project"    = "Curso AWS com Terraform"
      "Module"     = "Configuration Language"
      "Component"  = "Outputs"
      "CreatedAt"  = "2025-07-23"
      "ManagedBy"  = "Terraform"
      "Owner"      = "Edemir Toldo"
      "Repository" = "github.com/edemirtoldo/curso-terraform-aws"
    }
  }
}

resource "random_pet" "bucket" {
  length = 6
}

resource "aws_s3_bucket" "random" {
  bucket = random_pet.bucket.id
}
