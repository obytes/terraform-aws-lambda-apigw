resource "aws_apigatewayv2_route" "routes" {
  for_each       = var.routes_definitions
  api_id         = aws_apigatewayv2_api._.id

  # UPSTREAM
  target         = "integrations/${aws_apigatewayv2_integration._.id}"
  route_key      = each.value.route_key
  operation_name = each.value.operation_name

  # AUTHORIZATION
  authorizer_id        = lookup(local.authorizers_ids, lookup(each.value, "authorization_type", "NONE"), null)
  api_key_required     = lookup(each.value, "api_key_required", false)
  authorization_type   = lookup(each.value, "authorization_type", "NONE")
  authorization_scopes = lookup(each.value, "authorization_scopes", null)
}
