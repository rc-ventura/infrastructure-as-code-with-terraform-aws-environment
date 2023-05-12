output bucket_id {
    value = aws_s3_bucket.s3-terraform-state
}

output dynamodb_id  {
    value = aws_dynamodb_table.terraform-lock
}