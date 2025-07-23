locals {
  namespaced_service_name = "${var.service_name}-${var.environment}"

  required_tags = {
    "Project"    = "Curso AWS com Terraform"
    "Module"     = "Configuration Language"
    "Component"  = "Locals"
    "CreatedAt"  = "2025-07-23"
    "ManagedBy"  = "Terraform"
    "Owner"      = "Edemir Toldo"
    "Repository" = "github.com/cleber-gasparoto-org/curso-terraform-aws-3s"
  }

  common_tags = merge(local.required_tags, var.tags)
}
