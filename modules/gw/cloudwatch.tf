resource "aws_cloudwatch_log_group" "access" {
  name              = "${local.prefix}-access"
  tags              = local.common_tags
  retention_in_days = var.access_logs_retention_in_days
}
