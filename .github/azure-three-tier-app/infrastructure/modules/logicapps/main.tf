resource "azurerm_logic_app_workflow" "this" {
  name                = var.workflow_name
  location            = var.location
  resource_group_name = var.resource_group_name
  definition          = jsondecode(file("${path.module}/../../src/workflows/logicapp.json"))
  sku {
    name     = "Standard"
    tier     = "Standard"
  }
}

output "logic_app_url" {
  value = azurerm_logic_app_workflow.this.id
}