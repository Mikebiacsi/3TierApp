variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region for deployment."
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

variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
  default     = "3-tier-app-vnet"
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_names" {
  description = "The names of the subnets"
  type        = list(string)
}
variable "subnet_prefixes" {
  description = "The address prefixes for the subnets"
  type        = list(string)
}
variable "app_subnet_name" {
  description = "The name of the App Service subnet"
  type        = string
  default     = "app-subnet"
}
variable "app_subnet_prefix" {
  description = "The prefix for the app subnet."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "db_subnet_prefix" {
  description = "The prefix for the database subnet."
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan to be used."
  type        = string
  default     = "/subscriptions/your-subscription-id/resourceGroups/3-tier-app-rg/providers/Microsoft.Web/serverfarms/3-tier-app-service-plan"
}

variable "workflow_name" {
  description = "The name of the Logic App workflow."
  type        = string
  default     = "3-tier-app-workflow"

}

variable "workflow_definition" {
  description = "The workflow definition for the Logic App."
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
  default = "storage01"
}

variable "key_vault_resource_group" {
  description = "The resource group where the Key Vault is located."
  type        = string
  default     = "KeyVault01"
}