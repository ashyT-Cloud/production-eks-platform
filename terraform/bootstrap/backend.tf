terraform {
  backend "s3" {
    bucket         = "production-eks-platform-tfstate-487054650859"
    key            = "bootstrap/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "production-eks-platform-tf-lock"
    encrypt        = true
  }
}
