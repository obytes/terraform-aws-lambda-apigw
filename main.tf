module "gw" {
  source      = "./modules/gw"
  prefix      = var.prefix
  common_tags = var.common_tags

  stage_name         = var.stage_name
  api_lambda         = var.api_lambda
  jwt_authorizer     = var.jwt_authorizer
  routes_definitions = var.routes_definitions

  access_logs_retention_in_days = var.access_logs_retention_in_days
}
