resource "azurerm_logic_app_workflow" "this" {
  name                = var.workflow_name
  location            = var.location
  resource_group_name = var.resource_group_name
  # Removed invalid sku block
}

