variable "frontend_host_name" {
  description = "The frontend host name for Azure Front Door."
  type        = string
}

variable "backend_pool_name" {
  description = "The name of the backend pool for Azure Front Door."
  type        = string
}

variable "backend_host" {
  description = "The host name of the backend service."
  type        = string
}

variable "backend_http_port" {
  description = "The HTTP port for the backend service."
  type        = number
  default     = 80
}

variable "backend_https_port" {
  description = "The HTTPS port for the backend service."
  type        = number
  default     = 443
}

variable "routing_rule_name" {
  description = "The name of the routing rule for Azure Front Door."
  type        = string
}