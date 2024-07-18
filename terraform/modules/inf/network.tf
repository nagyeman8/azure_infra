resource "azurerm_virtual_network" "vnet" {
  name                = join("-", [local.name_prefix, "vnet"])
  address_space       = var.vnet_cidr
  location            = azurerm_resource_group.inf_rg.location
  resource_group_name = azurerm_resource_group.inf_rg.name

  tags = merge(local.default_tags, var.inf_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}

resource "azurerm_subnet" "app_subnet" {
  name                 = join("-", [local.name_prefix, "app", "snet"])
  resource_group_name  = azurerm_resource_group.inf_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(var.vnet_cidr[0], 8, 1)]
}

resource "azurerm_subnet" "database_subnet" {
  name                 = join("-", [local.name_prefix, "database", "snet"])
  resource_group_name  = azurerm_resource_group.inf_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(var.vnet_cidr[0], 8, 2)]
}