resource "aws_ecr_repository" "this" {
  for_each = var.repositories

  name = "${var.project_name}/${each.key}"

  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = each.value.scan_on_push
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = merge(
    local.common_tags,
    {
      Name = each.key
    }
  )
}


