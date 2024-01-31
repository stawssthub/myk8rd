module "key_vault" {
  source = "./modules/azurerm-modules-key-vault"

 providers = {
    azurerm =  azurerm.dev-sub
  }

  location = local.location

  name = {
    environment_abbreviation = local.env
  }
    
  resource_group_name      = azurerm_resource_group.ktest_rg.name
  settings= {
  public_network_access_enabled = true
  enable_rbac_authorization     = false
  purge_protection_enabled      = false
  sku_name                      = "standard"
  soft_delete_retention_days    = 7 
  }
  aks_object_id                 = module.aks.aks_object_id
  tags = var.tags
}
