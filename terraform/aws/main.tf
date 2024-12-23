
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}


resource "aws_s3tables_table_bucket" "this" {
  name = "${local.name}-${data.aws_caller_identity.current.account_id}"
}

resource "aws_s3tables_namespace" "this" {
  # Attribute namespace must contain only lowercase letters, numbers, or underscores
  namespace = "${replace(local.name,"-","_")}_ns"
  table_bucket_arn = aws_s3tables_table_bucket.this.arn
}
