module "aks" {
  source = "./modules/azurerm-modules-aks"
  providers = {
    azurerm = azurerm.dev-sub
  }
  location                 = local.location
  resource_group_name      = azurerm_resource_group.ktest_rg.name
  name = {
    environment_abbreviation = local.env
  }
  docker_bridge_cidr = local.docker_bridge_cidr
  service_cidr       = local.service_cidr
  dns_service_ip     = local.dns_service_ip
  aks_subnet_id = module.app_virtual_network.subnet_id["k8-snet"]
 tags = var.tags
   depends_on = [
    azurerm_resource_group.ktest_rg
  ]
}