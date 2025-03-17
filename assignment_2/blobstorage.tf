resource "azurerm_storage_account" "sa" {
  name                     = "tfstate9141"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "tfstate-container"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}