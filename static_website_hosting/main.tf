# Create the S3 Bucket 

resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
  tags = {
    Name        = "static-website-hosting"
    Environment = "dev"
  }
}

# Ownership of the bucket

resource "aws_s3_bucket_ownership_controls" "myownership" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


resource "aws_s3_bucket_public_access_block" "mypublicaccessblock" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "mybucketacl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.myownership,
    aws_s3_bucket_public_access_block.mypublicaccessblock,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"

}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"

}

resource "aws_s3_bucket_website_configuration" "mywebsiteconfiguration" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
  depends_on = [ aws_s3_bucket_acl.mybucketacl ]
}