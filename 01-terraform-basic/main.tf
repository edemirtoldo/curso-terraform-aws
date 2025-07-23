terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "tf_thinkpad_edemirtoldo"
}

resource "aws_s3_bucket" "example" {
  bucket = "o-bucket-do-edemir-criado-no-terraform-em-2025-07"

  tags = {
    CreatedAt = "2025-07-22"
    ManagedBy = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id

  versioning_configuration {
    status = "Enabled"
  }
}
