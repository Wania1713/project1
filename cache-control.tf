resource "aws_s3_bucket_object" "index_html" {
  bucket = "example-bucket-devops-project-1"
  key    = "index.html"

  content_type = "text/html"
  etag         = filemd5("${path.module}/index.html")

  cache_control = "max-age=86400, must-revalidate"
}

resource "aws_s3_bucket_object" "style_css" {
  bucket = "example-bucket-devops-project-1"
  key    = "style.css"

  content_type = "text/css"
  etag         = filemd5("${path.module}/style.css")

  cache_control = "max-age=604800, public"
}

resource "aws_s3_bucket_object" "script_js" {
  bucket = "example-bucket-devops-project-1"
  key    = "script.js"

  content_type = "application/javascript"
  etag         = filemd5("${path.module}/script.js")

  cache_control = "max-age=604800, public"
}
