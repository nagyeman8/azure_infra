data "azurerm_client_config" "client_config" {}


resource "azurerm_key_vault" "inf_kv" {
  name                            = join("-", [local.name_prefix, "inf", "kv"])
  location                        = azurerm_resource_group.inf_rg.location
  resource_group_name             = azurerm_resource_group.inf_rg.name
  sku_name                        = var.key_vault_sku
  tenant_id                       = data.azurerm_client_config.client_config.tenant_id
  enabled_for_deployment          = var.key_vault_enabled_for_deployment
  enabled_for_disk_encryption     = var.key_vault_enabled_for_disk_encryption
  enabled_for_template_deployment = var.key_vault_enabled_for_template_deployment

  tags = merge(local.default_tags, var.inf_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}

resource "azurerm_key_vault" "app_kv" {
  name                            = join("-", [local.name_prefix, "app", "kv"])
  location                        = azurerm_resource_group.inf_rg.location
  resource_group_name             = azurerm_resource_group.inf_rg.name
  sku_name                        = var.key_vault_sku
  tenant_id                       = data.azurerm_client_config.client_config.tenant_id
  enabled_for_deployment          = var.key_vault_enabled_for_deployment
  enabled_for_disk_encryption     = var.key_vault_enabled_for_disk_encryption
  enabled_for_template_deployment = var.key_vault_enabled_for_template_deployment

  tags = merge(local.default_tags, var.inf_override_tags)

  lifecycle {
    ignore_changes = [
      tags["CreatedOnDate"]
    ]
  }
}