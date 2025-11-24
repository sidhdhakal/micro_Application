variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "bucket_name" {
  description = "umesh-micro-service-bucket"
  type        = string
}

variable "environment" {
  description = "Environment tag (dev/prod)"
  type        = string
  default     = "dev"
}
