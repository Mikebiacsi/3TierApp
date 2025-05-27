variable "logic_app_name" {
  description = "The name of the Logic App."
  type        = string
  default     = "3-tier-app-logicapp"
}

variable "resource_group_name" {
  description = "The name of the resource group where the Logic App will be deployed."
  type        = string
}

variable "location" {
  description = "The Azure region where the Logic App will be deployed."
  type        = string
}

variable "workflow_name" {
  description = "The name of the Logic App workflow."
  type        = string
  default     = "3-tier-app-workflow"

}

variable resource_group_name {
  description = "The name of the routing rule for Azure Front Door."
  type        = string
  default     = "3-tier-app-rg"
}

variable "workflow_definition" {
  description = "The workflow definition for the Logic App."
  type        = string
}

locals {
  workflow_definition = jsonencode({
    "$schema" = "https://schema.management.azure.com/schemas/2016-06-01/workflowdefinition.json#"
    actions  = {}
    triggers = {}
  })
}