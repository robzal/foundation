#tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket" "cur_bucket" {
  bucket = "${var.customer_prefix}-cost-and-usage-reporting"
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
    "Effect": "Allow",
    "Principal": {
      "Service": "billingreports.amazonaws.com"
    },
    "Action": [
      "s3:GetBucketAcl",
      "s3:GetBucketPolicy"
    ],
    "Resource": "arn:aws:s3:::${var.customer_prefix}-cost-and-usage-reporting"
  },
  {
    "Effect": "Allow",
    "Principal": {
      "Service": "billingreports.amazonaws.com"
    },
    "Action": "s3:PutObject",
    "Resource": "arn:aws:s3:::${var.customer_prefix}-cost-and-usage-reporting/*"
  },
  {
      "Sid": "ForceSSLOnlyAccess",
      "Effect": "Deny",
      "Principal": { "AWS": "*" },
      "Action": "s3:*",
      "Condition": {
        "Bool": { "aws:SecureTransport": "false" }
      },
      "Resource":"arn:aws:s3:::${var.customer_prefix}-cost-and-usage-reporting/*"
    }
  ]
}
EOF
}

resource "aws_s3_bucket_public_access_block" "cur_bucket_public_access_block" {
  bucket = aws_s3_bucket.cur_bucket.id

  depends_on = [
    aws_s3_bucket.cur_bucket
  ]

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_cur_report_definition" "cur_report_definition" {
  provider = aws.us-east-1 # Resource only support us-east-1 region

  report_name                = "Hourly-Cost-and-Usage-Report"
  time_unit                  = "DAILY"
  format                     = "Parquet"
  compression                = "Parquet"
  additional_schema_elements = ["RESOURCES"]
  s3_bucket                  = aws_s3_bucket.cur_bucket.id
  s3_region                  = var.primary_region
}
