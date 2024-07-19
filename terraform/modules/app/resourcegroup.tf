resource "azurerm_resource_group" "app_rg" {
  name     = join("-", [local.name_prefix, "app", "rg"])
  location = var.env_location

  tags = merge(local.default_tags, var.app_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}