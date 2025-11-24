variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "fargate_profile_name" {
  type        = string
  description = "Name of the Fargate profile"
  default     = "default-fargate-profile"
}

variable "namespace" {
  type        = string
  description = "Namespace to run pods on Fargate"
  default     = "default"
}

variable "environment" {
  type        = string
}

variable "project" {
  type        = string
}
