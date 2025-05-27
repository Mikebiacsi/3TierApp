output "frontdoor_endpoint" {
  value = module.frontdoor.frontdoor_endpoint
}

output "appservice_url" {
  value = module.appservice.appservice_url
}

output "logicapp_url" {
  value = module.logicapps.logicapp_url
}

output "sql_connection_string" {
  value = module.sql.sql_connection_string
}

output "vnet_subnet_ids" {
  value = module.networking.subnet_ids
}