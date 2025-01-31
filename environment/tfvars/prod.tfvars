# terraform.tfvars

resource_groups = {
  rg1 = {
    resource_group_name = "azurermtodpapps"
    location            = "west us"
    tags = {
      Environment = "Development"
      Owner       = "Vivek"
    }
  }
}

default_tags = {
  Project = "TodoInfra"
  Managed = "Sysops"
}

lock_level = "ReadOnly"
/*
todoapp_aks = {
  aks = {
    name                = "azurermtodoapp"
    location            = "norway east"
    dns_prefix          = "todoappclu"
    resource_group_name = "azurermtodpapps"
    tags = {
      Environment = "Development"
      Owner       = "Vivek"
    }
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }
}

todoapp_acr = {
  acr = {
  name                = "azurermacr"
  resource_group_name = "azurermtodpapps"
  location            = "norway east"
  sku                 = "Premium"
  georeplicationsname = "East US"
  tags = {
    Environment = "Development"
    Owner       = "Vivek"
  }
}
}
/*
