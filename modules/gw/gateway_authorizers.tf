resource "aws_apigatewayv2_authorizer" "_" {
  name             = "${var.prefix}-jwt-authz"
  api_id           = aws_apigatewayv2_api._.id
  authorizer_type  = "JWT"
  identity_sources = ["$request.header.Authorization"]

  jwt_configuration {
    issuer   = var.jwt_authorizer.issuer
    audience = var.jwt_authorizer.audience
  }
}

locals {
  authorizers_ids = {
    JWT  = aws_apigatewayv2_authorizer._.id
    IAM  = null
    NONE = null
  }
}
