resource "azurerm_container_registry" "aks_acr" {
  name                = lower(replace("hyla-${var.name.environment_abbreviation}-acr", "-", ""))
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Basic"
}

resource "azurerm_role_assignment" "ra" {
  principal_id                     =  var.aks_object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.aks_acr.id
  skip_service_principal_aad_check = true
}