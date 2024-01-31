
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
  subscription_id     = "a83aa8d1-fd5e-42ff-a17c-0907465900ea"
  skip_provider_registration = true
  features {}
}


/*provider "azurerm" {
  alias               = "data-fabric-data-dev-global-001-sub"
  subscription_id     = ""
  skip_provider_registration = true
  features {}
} */
 