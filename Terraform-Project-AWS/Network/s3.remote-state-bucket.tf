resource "aws_s3_bucket" "terraform_state" {
  bucket = "igor-lab-2026-terraform-state"

  tags = {
    Name = "terraform-state"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}