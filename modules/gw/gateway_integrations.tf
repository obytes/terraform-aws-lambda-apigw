# -- Serverless
resource "aws_apigatewayv2_integration" "_" {
  api_id                 = aws_apigatewayv2_api._.id
  description            = "Lambda Serverless Upstream Service"

  passthrough_behavior   = "WHEN_NO_MATCH"
  payload_format_version = "2.0"

  # Upstream
  integration_type     = "AWS_PROXY"
  integration_uri      = var.api_lambda.invoke_arn
  connection_type      = "INTERNET"
  integration_method   = "POST"
  timeout_milliseconds = 29000

  lifecycle {
    ignore_changes = [
      passthrough_behavior
    ]
  }
}

