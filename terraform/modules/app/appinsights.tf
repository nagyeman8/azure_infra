resource "azurerm_log_analytics_workspace" "law" {
  name                = join("-", [local.name_prefix, "law"])
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = merge(local.default_tags, var.app_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}

resource "azurerm_application_insights" "ai" {
  name                = join("-", [local.name_prefix, "ai"])
  location            = azurerm_resource_group.app_rg.location
  resource_group_name = azurerm_resource_group.app_rg.name
  workspace_id        = azurerm_log_analytics_workspace.law.id
  application_type    = "web"

  tags = merge(local.default_tags, var.app_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}

