# terraform {
# backend s3 {
#     bucket = var.bucket_id
#     region =  var.region_id
#     key =  "${terraform.workspace}/terraform.state.tf"
#     dynamodb_table = var.dynamodb_id
#     encrypt = true
#     key_prefix = "env/"

# }

# }