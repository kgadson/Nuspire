resource "aws_iam_role" "iam_for_lambda_sqs2" {
  name = "iam_for_lambda_sqs2"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_function" "test_lambda" {
  filename         = "lambda_function_payload.zip"
  function_name    = "terraform-sqs-lambda"
  role             = "aws_iam_role.iam_for_lambda_sqs22.arn"
  handler          = "exports.test"
  source_code_hash = "filebase64sha256(lambda_function_payload.zip)"
  runtime          = "nodejs4.3"

  environment {
    variables = {
      foo = "bar"
    }
  }
}