resource "aws_s3_bucket" "s3-terraform-state" {

  bucket = "${local.prefix_name}mybucket-s3-terraform-state-bucket"

  tags = {

    Name        = "s3-bucket"
    Environment = var.env
  }

}

resource "aws_s3_bucket_lifecycle_configuration" "s3-terraform-objects-lifecycle" {

  bucket = aws_s3_bucket.s3-terraform-state.bucket

  rule {
    id     = "delete-objects-on-bucket-deletion"
    status = "Enabled"

    filter {
      prefix = "terraform/dev/state/"
    }
    expiration {
      expired_object_delete_marker = true
    }
  }
}