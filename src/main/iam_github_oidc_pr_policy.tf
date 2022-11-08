resource "aws_iam_role_policy" "tfstate_policy" {
  name = "assume_remote_state"
  role = "Foundation-ReadOnly"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["sts:AssumeRole"]
        Effect   = "Allow"
        Resource = "arn:aws:iam::*:role/terraform-cross-account-remote-state"
      },
    ]
  })
}
