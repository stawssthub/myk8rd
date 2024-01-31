resource "azurerm_resource_group" "ktest_rg" {
  provider = azurerm.dev-sub
  location = var.location
  name     = lower("hyla-${local.location}-${local.env}-k8-rg")
  tags     = var.tags
}


module "app_virtual_network" {
  source = "./modules/azurerm-modules-virtual-network"
  providers = {
    azurerm = azurerm.dev-sub
  }
  address_space              = local.Vnet_address_space
  location                   = local.location
  #dns_servers = var.dns_servers
  name = {
    environment_abbreviation = local.env
  }
    
  resource_group_name      = azurerm_resource_group.ktest_rg.name

  subnets = {
    k8-snet = {
      address_prefixes                              = local.subnet_address_prefix.k8-snet
    }
  }
  tags = var.tags
   depends_on = [
    azurerm_resource_group.ktest_rg
  ]
}
