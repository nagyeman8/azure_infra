resource "azurerm_app_configuration" "app_config" {
  name                = join("-", [local.name_prefix, "app", "config"])
  resource_group_name = azurerm_resource_group.app_rg.name
  location            = azurerm_resource_group.app_rg.location

  tags = merge(local.default_tags, var.app_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}