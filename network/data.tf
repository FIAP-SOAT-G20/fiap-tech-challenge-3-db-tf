data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "new-terraform-bucket"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
