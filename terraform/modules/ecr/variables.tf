variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "repositories" {
  description = "Container repositories to create"

  type = map(object({
    scan_on_push = bool
  }))
}
