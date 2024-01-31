output "app_service_planId" {
  value       = azurerm_service_plan.app_service_plan.id
  description = "The id of the App Service plan"
}