provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

output "s3_bucket_id" {
  description = "The name of the S3 bucket for Terraform state"
  value       = aws_s3_bucket.terraform_state.id
}
