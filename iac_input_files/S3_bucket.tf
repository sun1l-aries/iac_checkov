resource "aws_s3_bucket" "S3Bucket" {
	server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
        kms_master_key_id = "aws/s3"
      }
    }
  }
}

resource "aws_s3_bucket_versioning" "S3Bucket" {
  bucket = aws_s3_bucket.S3Bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}



resource "aws_s3_bucket_public_access_block" "blockPublicAccess" {
  bucket = aws_s3_bucket.S3Bucket.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}