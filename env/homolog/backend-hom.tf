# backend configuration
 
terraform {
  backend "s3" {
    bucket = "mybucket-s3-terraform-state-bucket"
    key = "terraform/dev/state/terraform.tfstate"
    region = "us-east-1"
    profile =  "terraform"
    dynamodb_table = "terraform-backend-s3-state-lock"
    
  }
<<<<<<< Updated upstream:backend.tf
}
=======
}  
>>>>>>> Stashed changes:env/homolog/backend-hom.tf
