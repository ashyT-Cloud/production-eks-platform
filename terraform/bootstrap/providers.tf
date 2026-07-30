provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project     = "production-eks-platform"
      Environment = "dev"
      ManagedBy   = "Terraform"
      Owner       = "Ashish"
    }
  }
}
