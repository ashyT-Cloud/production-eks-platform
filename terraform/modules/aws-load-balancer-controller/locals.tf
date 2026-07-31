locals {
  name_prefix = "${var.project_name}-${var.environment}"

  oidc_provider = replace(
    var.oidc_issuer_url,
    "https://",
    ""
  )

  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Owner       = "Ashish"
  }
}
