provider "aws" {
  region  = "us-east-1"
  version = "~> 2.0"
  alias   = "use1"
}

terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket = "desafio-tfstates-terraform"
    dynamodb_table = = "terraform_state_lock"
    key    = "terraform-test.tfstate"
    region = "us-east-1"
  }
}