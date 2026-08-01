output "repository_urls" {
  description = "Repository URLs"

  value = {
    for k, v in aws_ecr_repository.this :
    k => v.repository_url
  }
}
