variable "app_service_name" {
  description = "The name of the Azure App Service."
  type        = string
  default     = "3-tier-app-service"
}
variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
  default     = "3-tier-app-service-plan"

}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan to be used."
  type        = string
  default     = "/subscriptions/your-subscription-id/resourceGroups/3-tier-app-rg/providers/Microsoft.Web/serverfarms/3-tier-app-service-plan"
}

variable "app_name" {
  description = "The name of the Azure App Service."
  type        = string
  default     = "3-tier-app-service"

}

variable "app_settings" {
  description = "A map of application settings for the App Service."
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "The Azure region where the App Service will be deployed."
  type        = string
  default     = "uksouth"
}

variable resource_group_name {
  description = "The name of the routing rule for Azure Front Door."
  type        = string
  default     = "3-tier-app-rg"
}