resource "azurerm_kubernetes_cluster" "aks" {
  name                = "SolaborateAKS"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "solaborateaks"

  default_node_pool {
    name       = "default"
    node_count = 2 
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
    network_policy    = "azure"
  }

  depends_on = [azurerm_resource_group.main]
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
