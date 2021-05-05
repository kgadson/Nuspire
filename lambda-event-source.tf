# Event source from SQS
resource "aws_lambda_event_source_mapping" "event_source_mapping" {
  event_source_arn = "arn:aws:sqs:us-east-2:943325598256:terraform-sqs-lambda"
  enabled          = true
  function_name    = "terraform-sqs-lambda"
  batch_size       = 10
}