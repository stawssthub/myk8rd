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

variable "kubernetes_version" {
    type = string
    default = "1.27.7"
    description = "AKS version, always check for versions available"
}

variable "node_resource_group" {
    type = string
    default = "node_rg"
    description = "AKS node pool resource group, this is different from cluster rg"
}

variable "system_node_count" {
    type = string
    default = "2"
    description = "Total number of nodes in AKS node pool"
}

variable "network_plugin" {
    type = string
    default = "azure"
    description = "Choose between kubenet and azure cni. Kubenet is default, AzureCNI is preffered."
}

variable "docker_bridge_cidr" {
    type = list(string)
    description = "Internal docker bridge network CIDR"
}

variable "service_cidr" {
    type = string
    description = "Internal kubernetes services CIDR"
}

variable "dns_service_ip" {
    type = string
    description = "AKS DNS IP for name resolutions"
}

variable "resource_group_name" {
    type = string
    description = "AKS resource group"
}

variable "default_node_pool_name" {
  type = string
  default = "system"
}

variable "vm_size" {
  type = string
  default = "Standard_DS2_v2"
}

variable "enable_auto_scaling" {
  type = bool
  default = false
}

variable "aks_subnet_id" {
  type = string
}

variable "tags" {
  description = "(Required) Tags for the resources."
  type        = map(any)
}