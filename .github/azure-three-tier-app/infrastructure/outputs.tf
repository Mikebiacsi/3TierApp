output "frontdoor_endpoint" {
  value = module.frontdoor.frontdoor_endpoint
}

output "sql_connection_string" {
  value = module.sql.connection_string
}

output "app_service_url" {
  value = module.appservice.app_service_url
}

output "logic_app_url" {
  value = module.logicapps.logic_app_url
}

output "vnet_id" {
  value = module.networking.vnet_id
}