output "terraform_state_bucket" {
  description = "Name of the Terraform state bucket"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "terraform_lock_table" {
  description = "Name of the Terraform lock table"
  value       = aws_dynamodb_table.terraform_lock.name
}
