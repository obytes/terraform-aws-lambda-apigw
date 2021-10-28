######################
#     VARIABLES      |
######################
variable "prefix" {}
variable "common_tags" {
  type = map(string)
}

variable "stage_name" {
  type    = string
  default = "this"
}

variable "access_logs_retention_in_days" {
  type    = number
  default = 3
}

# JWT
variable "jwt_authorizer" {
  description = "JWT Authorizer Issuer/Audience (User Pool Endpoint and Client ID in case of Cognito)"
  type        = object({
    issuer   = string
    audience = list(string)
  })
}

# Upstream
variable "api_lambda" {
  type = object({
    name       = string
    alias      = string
    invoke_arn = string
  })
}

variable "routes_definitions" {
  default = {
    health_check = {
      operation_name = "Service Health Check"
      route_key      = "GET /v1/manage/hc"
    }
    whoami = {
      operation_name = "Get user claims"
      route_key      = "GET /v1/users/whoami"
      # Authorization
      api_key_required     = false
      authorization_type   = "JWT"
      authorization_scopes = ["aws.cognito.signin.user.admin"]
    }
    site_map = {
      operation_name = "Get site map"
      route_key      = "GET /v1/admins/site-map"
      # Authorization
      api_key_required     = false
      authorization_type   = "JWT"
      authorization_scopes = ["aws.cognito.signin.user.admin"]
    }
  }
}