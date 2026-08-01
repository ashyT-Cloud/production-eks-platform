output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint of the EKS control plane"
  value       = module.eks.cluster_endpoint
}

output "eks_node_group_name" {
  description = "Name of the EKS managed node group"
  value       = module.eks.node_group_name
}

output "eks_node_iam_role_arn" {
  description = "IAM role ARN used by EKS worker nodes"
  value       = module.eks.node_iam_role_arn
}

output "eks_oidc_provider_arn" {
  description = "IAM OIDC provider ARN for EKS"
  value       = module.eks.oidc_provider_arn
}

output "eks_oidc_issuer_url" {
  description = "OIDC issuer URL for the EKS cluster"
  value       = module.eks.oidc_issuer_url
}

module "aws_load_balancer_controller" {
  source = "../../modules/aws-load-balancer-controller"

  project_name = var.project_name
  environment  = var.environment

  oidc_provider_arn = module.eks.oidc_provider_arn
  oidc_issuer_url   = module.eks.oidc_issuer_url
}

output "aws_load_balancer_controller_role_arn" {
  description = "IRSA role used by the AWS Load Balancer Controller"
  value       = module.aws_load_balancer_controller.iam_role_arn
}

output "ecr_repository_urls" {
  description = "ECR repository URLs"

  value = module.ecr.repository_urls
}
