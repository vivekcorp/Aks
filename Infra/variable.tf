variable "resource_groups" {
  type = map(object({
    resource_group_name = string
    location            = string
    tags                = map(string)
  }))
  description = "A map of resource groups to create, with their names, locations, and tags."
}

variable "default_tags" {
  type        = map(string)
  default     = {}
  description = "Default tags applied to all resource groups. These can be overridden by resource-specific tags."
}

variable "lock_level" {
  type        = string
  default     = "CanNotDelete"
  description = "Lock level for the resource groups. Possible values: 'ReadOnly', 'CanNotDelete'."
}

variable "todoapp_aks" {
    type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    dns_prefix          = string
    tags                = map(string)
    node_count = number
    vm_size = string
  }))
}

variable "todoapp_acr" {
    type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku          = string
    tags                = map(string)
    georeplicationsname = string
    
  }))
}
