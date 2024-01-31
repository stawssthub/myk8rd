resource "azurerm_service_plan" "app_service_plan" {
  name                =  var.name 
  resource_group_name  = var.resource_group_name
  location                = var.location
  per_site_scaling_enabled = var.settings.per_site_scaling_enabled
  zone_balancing_enabled   = var.settings.zone_balancing_enabled
  os_type                  = var.settings.os_type
  sku_name                 = var.settings.sku_name
  tags = var.tags
}