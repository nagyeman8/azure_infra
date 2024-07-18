resource "azurerm_resource_group" "inf_rg" {
  name     = join("-", [local.name_prefix, "inf", "rg"])
  location = var.env_location

  tags = merge(local.default_tags, var.inf_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}

resource "azurerm_resource_group" "db_rg" {
  name     = join("-", [local.name_prefix, "db", "rg"])
  location = var.env_location

  tags = merge(local.default_tags, var.inf_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}