provider "aws" {
region = var.region
}


# Create ECR repo
resource "aws_ecr_repository" "app" {
name = "devops-project"
}


# (optional) Create EKS cluster using eks module
module "eks" {
source = "terraform-aws-modules/eks/aws"
version = "~> 19.0"


cluster_name = "devops-project-cluster"
cluster_version = "1.27"
subnets = var.private_subnets
vpc_id = var.vpc_id


node_groups = {
default = {
desired_capacity = 2
instance_type = "t3.medium"
}
}
}


output "ecr_repo_url" {
value = aws_ecr_repository.app.repository_url
}