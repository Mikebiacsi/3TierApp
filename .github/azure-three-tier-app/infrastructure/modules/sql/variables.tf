variable "sql_database_name" {
  description = "The name of the SQL Database"
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL Server"
  type        = string
}

variable "sql_admin_username" {
  description = "The administrator username for the SQL Server"
  type        = string
}

variable "sql_admin_password" {
  description = "The administrator password for the SQL Server"
  type        = string
  sensitive   = true
}

variable "sql_performance_tier" {
  description = "The performance tier for the SQL Database"
  type        = string
  default     = "Standard"
}

variable "geo_replicated" {
  description = "Enable geo-replication for the SQL Database"
  type        = bool
  default     = false
}

variable "geo_replicated_database_name" {
  description = "The name of the geo-replicated SQL Database"
  type        = string
  default     = ""
}