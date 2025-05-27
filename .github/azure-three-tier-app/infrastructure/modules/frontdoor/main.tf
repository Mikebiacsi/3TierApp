resource "azurerm_frontdoor" "main" {
  name                = var.frontend_host_name
  resource_group_name = var.resource_group_name
  # location attribute removed as it is not supported

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

    health_probe_name      = var.health_probe_name # Added required attribute
    load_balancing_name    = var.load_balancing_name # Added required attribute
  }

  backend_pool_health_probe {
    name                = var.health_probe_name # Added required block
    # backend_pool_id attribute removed as it is not supported
    path                = "/"
    interval_in_seconds = 30
    # target_url attribute removed as it is not supported
  }

  backend_pool_load_balancing {
    name                             = var.load_balancing_name # Added required block
    additional_latency_milliseconds  = 0
    sample_size                      = 4
    successful_samples_required      = 2
  }

  routing_rule {
    name               = var.routing_rule_name
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = [azurerm_frontdoor.frontend_endpoint.name]
    redirect_configuration {
      redirect_protocol = "MatchRequest"
      redirect_type = "Found"
    }
  }

  tags = var.tags
}