resource "azurerm_container_registry" "acr" {
    for_each = var.todoapp_acr
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.todoapp_acr[each.key].name
  location            = each.value.location
  sku                 = each.value.sku
  admin_enabled       = false
  georeplications {
    location                = each.value.georeplicationsname
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}