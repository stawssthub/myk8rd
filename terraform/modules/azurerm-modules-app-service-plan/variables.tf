variable "location" {
  description = "(Required) Azure region in which the resource will be provisioned."
  type        = string
}

variable "name" {
  description = "(Required) Collection of items that make up a resource name."
  type = string
}
variable "resource_group_name" {
  type        = string
  description = "Function app resource group"
} 

variable "settings" {
  description = "(Required) A Collection of settings for creating a Key Vault."
  type = object({
    contact = optional(object({
      email = string
      name  = optional(string)
      phone = optional(string)
    }))
    os_type = string
    sku_name = string
    zone_balancing_enabled = optional(bool, false)
    per_site_scaling_enabled= optional(bool, false)
  })

}

variable "tags" {
  description = "(Required) Tags for the resources."
  type        = map(any)
}
