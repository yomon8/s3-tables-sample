output "notebook_variables" {
    value = <<EOF

# Notebookに貼り付けて使います
AWS_ACCOUNT_ID="${data.aws_caller_identity.current.account_id}"
AWS_REGION="${data.aws_region.current.id}"
AWS_PROFILE="${var.profile}"
BUCKET_NAME="${aws_s3tables_table_bucket.this.name}"
NAMESPACE="${aws_s3tables_namespace.this.namespace}"

    EOF
}