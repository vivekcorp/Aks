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
