resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  address_prefixes = each.value.address_prefixes
  dynamic "delegation" {
    for_each = each.value.delegation
    content {
      name = delegation.key
      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = delegation.value.service_delegation.actions
      }
    }
  }
  name = alltrue([
    each.key != "GatewaySubnet",
    each.key != "AzureFirewallSubnet",
    each.key != "AzureBastionSubnet"
  ]) ? lower(each.key) : each.key
  resource_group_name                           = var.resource_group_name
  service_endpoints                             = each.value.service_endpoints
  service_endpoint_policy_ids                   = each.value.service_endpoint_policy_ids
  virtual_network_name                          = azurerm_virtual_network.app_virtual_network.name
}