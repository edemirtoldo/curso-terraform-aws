# https://developer.hashicorp.com/terraform/language/values/outputs

provider "aws" {
  region  = "eu-central-1"
  profile = "tf_macm1_ggasparoto"

  default_tags {
    tags = {
      "Project"    = "Curso AWS com Terraform"
      "Module"     = "Configuration Language"
      "Component"  = "Outputs"
      "CreatedAt"  = "2023-10-24"
      "ManagedBy"  = "Terraform"
      "Owner"      = "Cleber Gasparoto"
      "Repository" = "github.com/cleber-gasparoto-org/curso-terraform-aws-3s"
    }
  }
}

resource "random_pet" "bucket" {
  length = 6
}

resource "aws_s3_bucket" "random" {
  bucket = random_pet.bucket.id
}
