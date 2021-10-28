resource "aws_apigatewayv2_api" "_" {
  name          = "${local.prefix}-http-api"
  description   = "Lambda HTTP API"
  protocol_type = "HTTP"

  route_selection_expression   = "$request.method $request.path"
  api_key_selection_expression = "$request.header.x-api-key"

  cors_configuration {
    allow_credentials = false

    allow_headers = [
      "*"
    ]
    allow_methods = [
      "*"
    ]
    allow_origins = [
      "*"
    ]
    expose_headers = [
      "*"
    ]
  }

  tags          = local.common_tags
}
