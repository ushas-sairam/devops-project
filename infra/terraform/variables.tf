variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1" # change if needed
}

variable "vpc_id" {
  description = "VPC ID where EKS will be created"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs for worker nodes"
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "devops-project-cluster"
}
