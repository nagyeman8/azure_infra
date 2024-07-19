resource "azurerm_service_plan" "app_plan" {
  name                = join("-", [local.name_prefix, "asp"])
  resource_group_name = azurerm_resource_group.app_rg.name
  location            = azurerm_resource_group.app_rg.location
  os_type             = "Linux"
  sku_name            = "P1v2"

  tags = merge(local.default_tags, var.app_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}

resource "azurerm_linux_web_app" "web_app" {
  name                = join("-", [local.name_prefix, "web"])
  resource_group_name = azurerm_resource_group.app_rg.name
  location            = azurerm_service_plan.app_plan.location
  service_plan_id     = azurerm_service_plan.app_plan.id

  site_config {}

  tags = merge(local.default_tags, var.app_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}