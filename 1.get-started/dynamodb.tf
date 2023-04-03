resource "aws_dynamodb_table" "terra-state-cyber-duck" {
  name           = "terra-state-cyber-duckv1" # name of the DynamoDB table to be created
  hash_key       = "LockID"                 # the primary key attribute for the table
  read_capacity  = 20                       # read capacity units for the table
  write_capacity = 20                       # write capacity units for the table

  attribute {       # defines the attribute for the primary key
    name = "LockID" # name of the primary key attribute
    type = "S"      # type of the primary key attribute (string in this case)
  }

}
