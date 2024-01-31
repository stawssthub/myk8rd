/*variable "terraform_objectid" {
  description = "Terraform SPN Account with high privilages."
  type        = string
} */

variable "tags" {
  description = "Tags for the resources."
  type        = map(any)
}


variable "tenant_id" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "environment" {
  type        = string
  description = "Name of the deployment promotion environment"

  validation {
    condition     = var.environment == "dev" || var.environment == "qa" || var.environment == "uat" || var.environment == "prod" || var.environment == "dr"
    error_message = "Environment must be dev, qa, uat, dr, or prod."
  }
}




variable "subscription_id" {
  type = string
}

variable "vnet_address_space" {
  description = "app vnet address space."
  type = list(string)
}

variable "subnet_address_prefix" {
  type = object({
    k8-snet  = list(string)
  })
}


variable "private_dns_zones" {
  description = "(Optional) A list of private DNS zones to be used."
  type        = list(string)
  default     = []
}

variable "docker_bridge_cidr" {
  type = list(string)
  description = "IP address of docker bridge"
}

variable "service_cidr" {
  type = string
  description = "IP address of service cidr"
}

variable "dns_service_ip" {
  type = string
  description = "IP address of dns service"
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}