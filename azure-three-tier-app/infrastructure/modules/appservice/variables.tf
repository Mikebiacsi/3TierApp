variable "app_service_name" {
  description = "The name of the Azure App Service."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the App Service will be deployed."
  type        = string
}

variable "app_service_plan_id" {
  description = "The ID of the App Service Plan to be used."
  type        = string
}

variable "app_settings" {
  description = "A map of application settings for the App Service."
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "The Azure region where the App Service will be deployed."
  type        = string
}