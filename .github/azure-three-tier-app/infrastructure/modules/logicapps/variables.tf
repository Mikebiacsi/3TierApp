variable "logic_app_name" {
  description = "The name of the Logic App."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Logic App will be deployed."
  type        = string
}

variable "location" {
  description = "The Azure region where the Logic App will be deployed."
  type        = string
}

variable "workflow_definition" {
  description = "The JSON definition of the Logic App workflow."
  type        = string
}