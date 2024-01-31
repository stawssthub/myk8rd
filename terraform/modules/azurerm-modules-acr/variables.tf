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

variable "aks_object_id" {
  type = string
}

variable "tags" {
  description = "(Required) Tags for the resources."
  type        = map(any)
}