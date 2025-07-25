data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket  = "tfstate-2025-703671905295"
    key     = "dev/05-outputs/networking/terraform.tfstate"
    region  = "us-east-1"
    profile = "tf_thinkpad_edemirtoldo"
  }
}
