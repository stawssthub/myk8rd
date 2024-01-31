module "acr" {
  source = "./modules/azurerm-modules-acr"
  providers = {
    azurerm = azurerm.dev-sub
  }
  location                 = local.location
  resource_group_name      = azurerm_resource_group.ktest_rg.name
  name = {
    environment_abbreviation = local.env
  }
  aks_object_id                 = module.aks.aks_object_id
  tags = var.tags

}