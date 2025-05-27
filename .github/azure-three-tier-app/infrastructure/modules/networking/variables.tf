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

variable resource_group_name {
  description = "The name of the routing rule for Azure Front Door."
  type        = string
  default     = "3-tier-app-rg"
}

variable "location" {
  description = "The Azure region where the Virtual Network will be deployed."
  type        = string
  default = "uksouth"
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
variable "db_subnet_name" {
  description = "The name of the Database subnet"
  type        = string
  default     = "db-subnet"
}
variable "db_subnet_prefix" {
  description = "The prefix for the database subnet."
  type        = list(string)
  default     = ["10.0.2.0/24"]
}
variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
  default     = "3-tier-app-service-plan"

}