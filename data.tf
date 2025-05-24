data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "meu-terraform-state"
    key    = "network/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
