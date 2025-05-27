variable "resource_group_name" {
  description = "The name of the resource group where the resources will be deployed."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be deployed."
  type        = string
}

variable "frontdoor_name" {
  description = "The name of the Azure Front Door."
  type        = string
}

variable "app_service_name" {
  description = "The name of the Azure App Service."
  type        = string
}

variable "logic_app_name" {
  description = "The name of the Azure Logic App."
  type        = string
}

variable "sql_database_name" {
  description = "The name of the Azure SQL Database."
  type        = string
}

variable "sql_server_name" {
  description = "The name of the Azure SQL Server."
  type        = string
}

variable "sku" {
  description = "The SKU for the SQL Database."
  type        = string
  default     = "S0"
}

variable "geo_replicated" {
  description = "Enable geo-replication for the SQL Database."
  type        = bool
  default     = false
}

variable "app_service_plan_sku" {
  description = "The SKU for the App Service Plan."
  type        = string
  default     = "S1"
}

variable "frontend_host_name" {
  description = "The frontend host name for Azure Front Door."
  type        = string
}