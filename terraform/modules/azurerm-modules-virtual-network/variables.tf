variable "address_space" {
  description = "(Required) List of address spaces in CIDR notation to include in the virtual network."
  type        = list(string)
}

variable "dns_servers" {
  description = "(Optional) List of DNS servers to apply to the virtual networks."
  type        = list(string)
  default     = []
}

variable "location" {
  description = "(Required) Azure region in which the resource will be provisioned."
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
  }*/
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
  description = "(Required) Name of the Resource Group in which resources will be provisioned."
  type        = string
}

variable "subnets" {
  description = "(Optional) A map of subnets to be created in the virtual network"
  type = map(object({
    address_prefixes = list(string)
    delegation = optional(map(object({
      service_delegation = object({
        actions = optional(list(string))
        name    = string
      })
    })), {})
    private_endpoint_network_policies_enabled     = optional(bool)
    private_link_service_network_policies_enabled = optional(bool)
    service_endpoints                             = optional(list(string))
    service_endpoint_policy_ids                   = optional(list(string))
  }))
  default = {}
}

variable "tags" {
  description = "(Required) Tags for the resources."
  type        = map(any)
}
