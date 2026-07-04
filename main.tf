terraform {
  backend "s3" {
    bucket         = "syed-terraform-state-backend" # The bucket you just created manually
    key            = "global/s3/terraform.tfstate"   # The path inside the bucket where the state file will live
    region         = "us-east-1"                     # Must match your bucket's region
    encrypt        = true                            # Encrypts the state file at rest
  }
}

resource "aws_s3_bucket" "vault_test_bucket" {
  bucket        = "vault-test-bucket-syed-${random_id.id.hex}"
  force_destroy = true
}

resource "random_id" "id" {
  byte_length = 4
}