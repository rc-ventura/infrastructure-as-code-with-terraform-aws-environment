resource "aws_s3_bucket" "s3-terraform-state" {
  count  = var.is_dev_workspace ? 0 : 1
  bucket = "s3-terraform-state-bucket-${local.prefix_name}"


  
  tags =  {
      Name        = "s3-bucket"
      Enviroment = count.index == 0 ? terraform.workspace : null
    } 
    
}

resource "aws_s3_bucket_lifecycle_configuration" "s3-terraform-objects-lifecycle" {
  count  = var.is_dev_workspace ? 0 : 1

  bucket = aws_s3_bucket.s3-terraform-state[count.index]

  rule {
    id     = "delete-objects-on-bucket-deletion"
    status = "Enabled"

    filter {
      prefix = "terraform/state/"
    }
    expiration {
      expired_object_delete_marker = true
    }
  }
}