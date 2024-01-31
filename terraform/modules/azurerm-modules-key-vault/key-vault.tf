locals {
    name  = lower(replace("hyla-${var.name.environment_abbreviation}", "-", ""))
}
resource "azurerm_key_vault" "aks_kv" {

  enabled_for_deployment          = var.settings.enabled_for_deployment
  enabled_for_disk_encryption     = var.settings.enabled_for_disk_encryption
  enabled_for_template_deployment = var.settings.enabled_for_template_deployment
  enable_rbac_authorization       = var.settings.enable_rbac_authorization
  location                        = var.location
  name                            = lower("${local.name}-kv")
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled      = var.settings.purge_protection_enabled
  public_network_access_enabled = var.settings.public_network_access_enabled
  resource_group_name           = var.resource_group_name
  sku_name                      = var.settings.sku_name
  soft_delete_retention_days    = var.settings.soft_delete_retention_days
  tags                          = var.tags
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge"
    ]
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Encrypt",
      "Decrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Sign",
      "Purge"
    ]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.aks_object_id

    key_permissions = [
      "Get",
      "List"
    ]

    secret_permissions = [
      "Get",
      "List"
    ]

    certificate_permissions = [
      "Get",
      "List"
    ]
  }  
}