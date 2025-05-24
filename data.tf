data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "fastfood-terraform-state-g22-tc3"
    key    = "k8s/terraform.tfstate"
    region = "us-east-1"
  }
}
