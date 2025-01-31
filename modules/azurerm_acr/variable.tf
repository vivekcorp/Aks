variable "todoapp_acr" {
    type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    georeplicationsname = string
    sku          = string
    tags                = map(string)
    
  }))
}
