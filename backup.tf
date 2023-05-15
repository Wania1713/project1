# backup.tf

resource "aws_s3_bucket_lifecycle_configuration" "static_website_lifecycle" {
  rule {
    id      = "static_website_backups"
    status  = "Enabled"
    prefix  = ""
    transition {
      days          = 30
      storage_class = "GLACIER"
    }
  }

  bucket = "example-bucket-devops-project-1"
}

resource "aws_s3_bucket_versioning" "static_website_versioning" {
  bucket = "example-bucket-devops-project-1"

  versioning_configuration {
    status = "Enabled"
  }
}

