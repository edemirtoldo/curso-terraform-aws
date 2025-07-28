terraform {
  required_version = "~> 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.15"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }

  backend "s3" {
    bucket         = "tfstate-2025-703671905295"
    key            = "dev/06-terraform-test/terraform.tfstate"
    region         = "us-east-1"
    profile        = "tf_thinkpad_edemirtoldo"
    dynamodb_table = "tflock-tfstate-2025-703671905295"
  }
}
