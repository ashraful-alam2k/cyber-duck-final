resource "aws_s3_bucket" "cyber-duck" {
  bucket = "terra-state-cyber-duck"
  tags = {
    Terraform = true
    Project   = "Cyber-duck"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.cyber-duck.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}