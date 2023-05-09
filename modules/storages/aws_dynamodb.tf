resource "aws_dynamodb_table" "terraform-lock" {
  name         = "${local.prefix_name}terraform-backend-s3-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {

    name = "LockID"
    type = "S"


  }

  tags = {
    Name        = "dynamodb"
    Environment = var.env
  }

}