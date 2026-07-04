resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "vault_secured_bucket" {
  bucket        = "my-secure-vault-bucket-${random_id.bucket_suffix.hex}"
  force_destroy = true

  tags = {
    Environment = "Dev"
    ManagedBy   = "Terraform + Vault OIDC"
  }
}

output "bucket_name" {
  value       = aws_s3_bucket.vault_secured_bucket.id
  description = "The name of the created S3 bucket"
}