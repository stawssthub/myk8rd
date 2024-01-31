output "name" {
  description = "Name of the provisioned virtual network."
  value       = azurerm_virtual_network.app_virtual_network.name
}

output "id" {
  description = "The resource ID of the provisioned virtual network."
  value       = azurerm_virtual_network.app_virtual_network.id
}

output "subnet_id" {
  description = "Map of subnet name to ID's that exist in the virtual network."
  value       = { for k, v in azurerm_subnet.subnet : k => v.id }
} 