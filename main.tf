resource "azurerm_kubernetes_cluster" "aks" 
  {
  name                = "aks-cluster"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "aks-cluster"
  
  default_node_pool {
    name                = "nodepool1"
    node_count          = 2
    vm_size             = "Standard_DS2_v2"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 5
  }
  
  identity {
    type = "SystemAssigned"
  }
}
