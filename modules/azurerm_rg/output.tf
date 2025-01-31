output "resource_group_names" {
  value = { for rg_key, rg in azurerm_resource_group.todo : rg_key => rg.name }
  description = "A map of resource group names indexed by their keys."
}

output "resource_group_ids" {
  value = { for rg_key, rg in azurerm_resource_group.todo : rg_key => rg.id }
  description = "A map of resource group IDs indexed by their keys."
}

output "resource_group_locations" {
  value = { for rg_key, rg in azurerm_resource_group.todo : rg_key => rg.location }
  description = "A map of resource group locations indexed by their keys."
}
