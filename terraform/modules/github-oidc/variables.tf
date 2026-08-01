variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "github_owner" {
  description = "GitHub organization or username"
  type        = string
}

variable "github_repositories" {
  description = "GitHub repositories allowed to assume this IAM role"
  type        = list(string)
}
