variable "access_policies" {
  description = "(Optional) Access policies to provision on the key vault (map keys are the object_ids to which the permissions will be assigned)."
  type = map(object({
    application_id          = optional(string)
    object_id               = optional(string)
    certificate_permissions = optional(list(string))
    key_permissions         = optional(list(string))
    secret_permissions      = optional(list(string))
    storage_permissions     = optional(list(string))
  }))
  default = {}
}

variable "location" {
  description = "(Required) Azure region in which the Key Vault will be provisioned."
  type        = string
}

variable "name" {
   description = "(Required) Collection of items that make up a resource name."
  type = object({
    environment_abbreviation = string
    iterator                 = optional(string)
    region_abbreviation      = optional(string)
    workload                 = optional(string)
  })
  /*validation {
    condition     = length(var.name.iterator) == 3
    error_message = "Iterator must be 3 digits long.  Leading zeros are acceptable."
  } */
  validation {
    condition     = length(var.name.environment_abbreviation) <= 3
    error_message = "Environment abbreviation can have a max 3 characters.  Example values are 'dev', 'inf', 'prd', 'qa', 'stg', 'tst', 'uat'."
  }
  /*validation {
    condition     = length(var.name.region_abbreviation) <= 4
    error_message = "Region abbreviation can have a max of 4 characters."
  }*/
}

variable "resource_group_name" {
  description = "(Required) Name of the Resource Group in which the Key Vault resources will be provisioned."
  type        = string
}

variable "settings" {
  description = "(Required) A Collection of settings for creating a Key Vault."
  type = object({
    contact = optional(object({
      email = string
      name  = optional(string)
      phone = optional(string)
    }))
    enabled_for_deployment          = optional(bool, true)
    enabled_for_disk_encryption     = optional(bool, true)
    enabled_for_template_deployment = optional(bool, true)
    enable_rbac_authorization       = optional(bool)
    network_acls = optional(object({
      bypass                     = optional(string, "AzureServices")
      default_action             = optional(string, "Deny")
      ip_rules                   = optional(list(string), [])
      virtual_network_subnet_ids = optional(list(string), [])
    }))
    private_endpoint = optional(object({
      private_dns_zone_ids = optional(list(string))
      subnet_id            = string
    }))
    purge_protection_enabled      = optional(bool, false)
    public_network_access_enabled = optional(bool, true)
    sku_name                      = optional(string, "standard")
    soft_delete_retention_days    = optional(number, 7)
  })
  /*validation {
    condition     = contains(["AzureServices", "None"], var.settings.network_acls.bypass)
    error_message = "Network ACLs bypass requires a value of 'AzureServices' or 'None'."
  }
  validation {
    condition     = contains(["Allow", "Deny"], var.settings.network_acls.default_action)
    error_message = "Network ACLs default action requires a value of 'Allow' or 'Deny'."
  }*/
  validation {
    condition     = contains(["standard", "premium"], var.settings.sku_name)
    error_message = "Key vault SKU requires a value of 'standard' or 'premium'."
  }
  validation {
    condition = alltrue([
      var.settings.soft_delete_retention_days >= 7,
      var.settings.soft_delete_retention_days <= 90
    ])
    error_message = "Soft delete retention requires a value from 7 to 90 days."
  }
}

variable "aks_object_id" {
  type = string
}
variable "tags" {
  description = "(Required) Tags for the resources."
  type        = map(any)
}