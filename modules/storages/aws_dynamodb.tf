resource "aws_dynamodb_table" "terraform-lock" {
  count  = var.is_dev_workspace ? 0 : 1

  name         = "terraform-s3-state-lock-${local.prefix_name}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"


  attribute {

    name = "LockID"
    type = "S"


  }

  tags =  {
      Name        = "dynamodb"
      Enviroment = count.index == 0 ? terraform.workspace : null
    } 
    

}