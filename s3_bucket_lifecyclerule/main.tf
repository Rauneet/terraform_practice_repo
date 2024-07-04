# State Bucket

resource "aws_s3_bucket" "state_bucket" {
  bucket        = var.state_bucket_name
  force_destroy = var.force_destroy_value
  tags = var.tags
}
# Enable bucket versioning for state bucket

resource "aws_s3_bucket_versioning" "state_bucket_versioning" {
  bucket = aws_s3_bucket.state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "state_bucket_lifecycle" {
  bucket = aws_s3_bucket.state_bucket.id
  rule {
    id     = "state_bucket"
    status = "Enabled"
    expiration {
      days = var.state_bucket_expiration_days
    }
    noncurrent_version_expiration {
      noncurrent_days = var.noncurrent_version_expiration_days_for_state_bucket
    }
    abort_incomplete_multipart_upload {
      days_after_initiation = 60
    }

  }
}

# Create artifact bucket
resource "aws_s3_bucket" "artifact_bucket" {
  bucket        = var.artifact_bucket_name
  force_destroy = var.force_destroy_value
  tags = var.tags

}

# Enable bucket versioning for artifact bucket
resource "aws_s3_bucket_versioning" "artifact_bucket_versioning" {
  bucket = aws_s3_bucket.artifact_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "artifact_bucket_lifecycle" {
  bucket = aws_s3_bucket.artifact_bucket.id
  rule {
    id     = "artifact_bucket"
    status = "Enabled"
    expiration {
      days = var.artifact_bucket_expiration_days
    }
    noncurrent_version_expiration {
      noncurrent_days = var.noncurrent_version_expiration_days_for_artifact_bucket
    }
    noncurrent_version_transition {
      noncurrent_days = var.noncurrent_version_transition_artifact_bucket
      storage_class   = var.storage_class_value
    }
  }
}

# Create a Deployment context bucket 

resource "aws_s3_bucket" "deployment_context" {
  bucket        = var.deployment_context_bucket_name
  force_destroy = var.force_destroy_value
  tags = var.tags

}

# Enable bucket versioning for deployment context bucket
resource "aws_s3_bucket_versioning" "deployment_context_bucket_versioning" {
  bucket = aws_s3_bucket.deployment_context.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "deployment_context_lifecycle" {
  bucket = aws_s3_bucket.deployment_context.id
  rule {
    id     = "deployment_context"
    status = "Enabled"
    expiration {
      days = var.deployment_context_expiration_days
    }
    noncurrent_version_expiration {
      noncurrent_days = var.noncurrent_version_expiration_days_for_deployment_context_bucket
    }
    noncurrent_version_transition {
      noncurrent_days = var.noncurrent_version_transition_deployment_context_bucket
      storage_class   = var.storage_class_value
    }
  }

}





