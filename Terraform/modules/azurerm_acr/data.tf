data "azurerm_resource_group" "todoapp_acr" {
  for_each = var.todoapp_acr
  name = each.value.resource_group_name
}