locals {

  role_name = "${var.project_name}-${var.environment}-github-actions"

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Ashish"
  }

}
