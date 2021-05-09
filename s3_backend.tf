terraform {
  backend "s3" {
    bucket         = "elementum-terraform12-state-int"
    key            = "us-east-1/wss.tfstate"
    region         = "us-east-1"
    profile        = "techops-admin"
    dynamodb_table = "terraform_statelock_int_us-east-1"
  }
}