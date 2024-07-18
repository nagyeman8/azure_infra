resource "azurerm_network_security_group" "default_nsg" {
  name                = join("-", [local.name_prefix, "default", "nsg"])
  location            = azurerm_resource_group.inf_rg.location
  resource_group_name = azurerm_resource_group.inf_rg.name

  tags = merge(local.default_tags, var.inf_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}