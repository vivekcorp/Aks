resource "azurerm_resource_group" "todo" {
  for_each = var.resource_groups

  name     = each.value.resource_group_name
  location = each.value.location
  tags     = merge(var.default_tags, each.value.tags)
}

# resource "azurerm_management_lock" "todolock" {
#   for_each = var.resource_groups

#   name       = "${each.value.resource_group_name}-lock"
#   scope      = azurerm_resource_group.todo[each.key].id
#   lock_level = var.lock_level

#   depends_on = [azurerm_resource_group.todo]
# }
