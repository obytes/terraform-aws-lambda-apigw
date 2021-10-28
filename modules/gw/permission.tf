resource "aws_lambda_permission" "_" {
  statement_id  = "AllowExecutionFromAPIGatewayV2"
  action        = "lambda:InvokeFunction"
  function_name = var.api_lambda.name
  principal     = "apigateway.amazonaws.com"
  qualifier     = var.api_lambda.alias
  source_arn    = "${aws_apigatewayv2_api._.execution_arn}/${aws_apigatewayv2_stage._.name}/*/*"
}
