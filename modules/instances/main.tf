resource "aws_key_pair" "terraform_aws_auth" {
  key_name = "terraform_aws_key"
  public_key = file("~/.ssh/terraform_aws_key.pub")


}