terraform {
  required_version = "~> 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.22"
    }
  }

  backend "s3" {
    bucket         = "tfstate-2025-703671905295"
    key            = "dev/05-outputs/instances/terraform.tfstate"
    region         = "us-east-1"
    profile        = "tf_thinkpad_edemirtoldo"
    dynamodb_table = "tflock-tfstate-2025-703671905295"
  }
}
