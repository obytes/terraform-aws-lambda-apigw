output "http_api_id" {
  value = aws_apigatewayv2_api._.id
}

output "http_api_stage_name" {
  value = aws_apigatewayv2_stage._.name
}
