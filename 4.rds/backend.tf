terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "terra-state-cyber-duckv1"
    dynamodb_table = "terra-state-cyber-duckv1"
    key            = "cyber-duck/rds/terraform.tfstate"
    region         = "eu-west-2"


  }

}