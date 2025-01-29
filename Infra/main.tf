module "resource_groups" {
  source = "../modules/azurerm_rg"
  resource_groups = var.resource_groups
  default_tags    = var.default_tags
  lock_level      = var.lock_level
}

module "todoapp_aks" {
  depends_on = [ module.resource_groups ]
  source = "../modules/azurerm_aks"
  todoapp_aks= var.todoapp_aks
  
}

module "azurerm_acr" {
  depends_on = [ module.resource_groups ]
  source = "../modules/azurerm_acr"
  todoapp_acr = var.todoapp_acr
  
}