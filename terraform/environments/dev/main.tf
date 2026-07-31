module "vpc" {
  source = "../../modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = "10.0.0.0/16"

  public_subnets = {
    public-a = {
      cidr = "10.0.1.0/24"
      az   = "us-east-1a"
    }
    public-b = {
      cidr = "10.0.2.0/24"
      az   = "us-east-1b"
    }
  }

  private_subnets = {
    private-a = {
      cidr = "10.0.11.0/24"
      az   = "us-east-1a"
    }
    private-b = {
      cidr = "10.0.12.0/24"
      az   = "us-east-1b"
    }
  }
}

module "eks" {
  source = "../../modules/eks"

  project_name       = var.project_name
  environment        = var.environment
  cluster_version    = "1.36"
  private_subnet_ids = module.vpc.private_subnet_ids
}
