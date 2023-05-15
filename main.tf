terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

provider "aws" {
  access_key = "AKIAQCE7WD5IX5OCN3RQ"
  secret_key = "GDTxLD3B0MGjh7HAUHDXn9CJCgaPJ0JYP28UEvwH"
  region     = "us-west-2"
}
resource "aws_s3_bucket" "static_website" {
  bucket = "example-bucket-devops-project-1"
  acl    = "private"

  versioning {
    enabled = true
  }
}


resource "aws_s3_bucket_policy" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Deny",
        "Principal": "*",
        "Action": "s3:GetObject",
        "Resource": "${aws_s3_bucket.static_website.arn}/*"
      }
    ]
  })
}



