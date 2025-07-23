data "aws_caller_identity" "current" {}

data "aws_s3_bucket" "caixa_do_edemir" {
  bucket = "a-caixa-magica-do-edemir-001"
}

data "aws_dynamodb_table" "tableName" {
  name = "minha-tabela-no-dynamodb"
}
