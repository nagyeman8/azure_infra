resource "azurerm_monitor_action_group" "app_ag" {
  name                = join("-", [local.name_prefix, "app", "ag"])
  resource_group_name = azurerm_resource_group.mon_rg.name
  short_name          = "app-mon"
}

resource "azurerm_monitor_action_group" "inf_ag" {
  name                = join("-", [local.name_prefix, "inf", "ag"])
  resource_group_name = azurerm_resource_group.mon_rg.name
  short_name          = "inf-mon"
}

resource "azurerm_monitor_action_group" "sec_ag" {
  name                = join("-", [local.name_prefix, "sec", "ag"])
  resource_group_name = azurerm_resource_group.mon_rg.name
  short_name          = "sec-mon"
}