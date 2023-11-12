terraform {
  backend "s3" {
    bucket         = "mys3b2"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "stateLockTable"
  }
}