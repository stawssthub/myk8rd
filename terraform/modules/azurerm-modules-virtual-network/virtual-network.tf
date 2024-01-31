resource "azurerm_virtual_network" "app_virtual_network" {
  address_space       = var.address_space
  location            = var.location
  name                = lower("hyla-${var.name.environment_abbreviation}-vnet")
  resource_group_name = var.resource_group_name
  tags                = var.tags
}