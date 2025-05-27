variable "frontend_host_name" {
  description = "The frontend host name for Azure Front Door."
  type        = string
  default     = "3-tier-app-frontend.azurefd.net"
}

variable "frontend_endpoint_name" {
  description = "The name of the frontend endpoint for Azure Front Door."
  type        = string
  default     = "frontend-endpoint1"
}
variable "backend_host_header" {
  description = "The host header for the backend service."
  type        = string
  default     = "backend-pool1.azurewebsites.net"
}
variable "backend_address" {
  description = "The address of the backend service."
  type        = string
  default     = "backend-pool1.azurewebsites.net"
}
variable "health_probe_name" {
  description = "The name of the health probe for Azure Front Door."
  type        = string
  default     = "health-probe1"
}
variable "load_balancing_name" {
  description = "The name of the load balancing settings for Azure Front Door."
  type        = string
  default     = "load-balancing1"
}
# Variables for Azure Front Door configuration
# These variables are used to configure the Azure Front Door service
# in the 3-tier application architecture.
# They include settings for the frontend host, backend pool, health probes,
# load balancing, and routing rules.
# The default values are set to match the expected configuration for the application.
variable "tags" {
  description = "A map of tags to assign to the Azure Front Door resources."
  type        = map(string)
  default     = {
    environment = "production"
    project     = "3-tier-app"
  }
}

variable "backend_pool_name" {
  description = "The name of the backend pool for Azure Front Door."
  type        = string
  default     = "backend-pool1"
}

variable "backend_host" {
  description = "The host name of the backend service."
  type        = string
  default     = "backend-pool1.azurewebsites.net"
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
  default     = "routing-rule1"
}

variable resource_group_name {
  description = "The name of the routing rule for Azure Front Door."
  type        = string
  default     = "3-tier-app-rg"
}