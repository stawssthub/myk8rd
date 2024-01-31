resource "azurerm_kubernetes_cluster" "aks" {
  name                = lower("hyla-${var.name.environment_abbreviation}-aks")
  kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = lower("hyla-${var.name.environment_abbreviation}-aks")
  node_resource_group = var.node_resource_group

  default_node_pool {
    name                = var.default_node_pool_name
    node_count          = var.system_node_count
    vm_size             = var.vm_size
    type                = "VirtualMachineScaleSets"
    enable_auto_scaling = var.enable_auto_scaling
    vnet_subnet_id  =   var.aks_subnet_id
 }

  identity {
    type = "SystemAssigned"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
    secret_rotation_interval = "1m"
  }

  network_profile {
    network_plugin     = var.network_plugin
    load_balancer_sku  = "standard"
    #docker_bridge_cidr = var.docker_bridge_cidr
    service_cidr       = var.service_cidr
    dns_service_ip     = var.dns_service_ip
  }
}