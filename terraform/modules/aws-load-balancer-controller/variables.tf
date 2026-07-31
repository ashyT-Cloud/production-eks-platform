variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN of the EKS IAM OIDC provider"
  type        = string
}

variable "oidc_issuer_url" {
  description = "OIDC issuer URL of the EKS cluster"
  type        = string
}

variable "service_account_namespace" {
  description = "Kubernetes namespace of the controller service account"
  type        = string
  default     = "kube-system"
}

variable "service_account_name" {
  description = "Kubernetes service account used by the controller"
  type        = string
  default     = "aws-load-balancer-controller"
}
