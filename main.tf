resource "aws_s3_bucket" "vault_test_bucket" {
  bucket        = "vault-test-bucket-syed-${random_visual_id.id.hex}"
  force_destroy = true
}

resource "random_id" "id" {
  byte_length = 4
}