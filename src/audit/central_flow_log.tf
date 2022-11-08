#tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket" "flow_logs_bucket" {
  bucket = "${var.customer_prefix}-central-flow-logs"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  versioning {
    enabled = true
  }

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AWSLogDeliveryWrite",
      "Effect": "Allow",
      "Principal": {"Service": "delivery.logs.amazonaws.com"},
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::${var.customer_prefix}-central-flow-logs/*"
    },
    {
      "Sid": "AWSLogDeliveryCheck",
      "Effect": "Allow",
      "Principal": {"Service": "delivery.logs.amazonaws.com"},
      "Action": ["s3:GetBucketAcl", "s3:ListBucket"],
      "Resource": "arn:aws:s3:::${var.customer_prefix}-central-flow-logs"
    },
    {
      "Sid": "ForceSSLOnlyAccess",
      "Effect": "Deny",
      "Principal": { "AWS": "*" },
      "Action": "s3:*",
      "Condition": {
        "Bool": { "aws:SecureTransport": false }
      },
      "Resource":"arn:aws:s3:::${var.customer_prefix}-central-flow-logs/*"
    }
  ]
}
EOF

}

resource "aws_s3_bucket_public_access_block" "flow_logs_bucket_public_access_block" {
  bucket = aws_s3_bucket.flow_logs_bucket.id

  depends_on = [
    aws_s3_bucket.flow_logs_bucket
  ]

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
