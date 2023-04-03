terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terra-state-cyber-duck"
    dynamodb_table = "terra-state-cyber-duck"
    key            = "cyber-duck/rds/terraform.tfstate"
    region         = "us-east-1"


  }

}