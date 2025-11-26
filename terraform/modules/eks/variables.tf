variable "cluster_name" {
  type        = string
  description = "EKS Cluster Name"
}

variable "cluster_version" {
  type        = string
  description = "EKS Kubernetes version"
  default     = "1.30"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnets for EKS nodes"
}

variable "environment" {
  type        = string
  description = "Environment name (dev/prod)"
}

variable "project" {
  type        = string
  description = "Project name"
}
