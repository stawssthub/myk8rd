
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}



provider "azurerm" {
  alias               = "dev-sub"
  #subscription_id     = var.subscription_id
  #client_id = var.client_id
  #client_secret = var.client_secret
  #tenant_id = var.tenant_id
  skip_provider_registration = true
  features {}
}


/*provider "azurerm" {
  alias               = "data-fabric-data-dev-global-001-sub"
  subscription_id     = ""
  skip_provider_registration = true
  features {}
} */
 