resource "azurerm_frontdoor" "main" {
  name                = var.frontend_host_name
  resource_group_name = var.resource_group_name
  location            = var.location

  frontend_endpoint {
    name      = var.frontend_endpoint_name
    host_name = var.frontend_host_name
  }

  backend_pool {
    name = var.backend_pool_name

    backend {
      host_header = var.backend_host_header
      address     = var.backend_address
      http_port   = 80
      https_port  = 443
      priority    = 1
      weight      = 100
    }
  }

  routing_rule {
    name               = var.routing_rule_name
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = [azurerm_frontdoor.frontend_endpoint.name]
    backend_pool_id    = azurerm_frontdoor.backend_pool.id
    redirect_configuration {
      redirect_type = "Found"
      target_url    = "https://${var.frontend_host_name}"
    }
  }

  tags = var.tags
}