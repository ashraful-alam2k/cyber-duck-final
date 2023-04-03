# creates an S3 bucket named "terra-state-cyber-duck" and applies metadata tags
resource "aws_s3_bucket" "cyber-duck" {
  bucket = "terra-state-cyber-duckv1"
  tags = {
    Terraform = true
    Project   = "Cyber-duck"
  }
}

# applies a public access block to the S3 bucket created in the previous block

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket = aws_s3_bucket.cyber-duck.id
  # the following settings prevent public access to various aspects of the S3 bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}