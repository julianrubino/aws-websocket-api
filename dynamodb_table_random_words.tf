### AWS DynamoDB table RandomWords
resource "aws_dynamodb_table" "random_words" {
  name           = "RandomWords"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "word"

  attribute {
    name = "word"
    type = "S"
  }

}

### AWS DynamoDB table item-01
resource "aws_dynamodb_table_item" "word_01" {
  table_name = aws_dynamodb_table.random_words.name
  hash_key   = aws_dynamodb_table.random_words.hash_key

  item = <<ITEM
{
  "word": {"S": "car"}
}
ITEM
}

### AWS DynamoDB table item-02
resource "aws_dynamodb_table_item" "word_02" {
  table_name = aws_dynamodb_table.random_words.name
  hash_key   = aws_dynamodb_table.random_words.hash_key

  item = <<ITEM
{
  "word": {"S": "truck"}
}
ITEM
}

### AWS DynamoDB table item-03
resource "aws_dynamodb_table_item" "word_03" {
  table_name = aws_dynamodb_table.random_words.name
  hash_key   = aws_dynamodb_table.random_words.hash_key

  item = <<ITEM
{
  "word": {"S": "banana"}
}
ITEM
}