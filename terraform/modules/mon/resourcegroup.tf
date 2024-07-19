resource "azurerm_resource_group" "mon_rg" {
  name     = join("-", [local.name_prefix, "mon", "rg"])
  location = var.env_location

  tags = merge(local.default_tags, var.mon_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}