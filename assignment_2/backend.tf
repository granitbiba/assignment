terraform {
  backend "azurerm" {
    resource_group_name  = "SolaborateRG"
    storage_account_name = "tfstate9141"
    container_name       = "tfstate-container"
    key                  = "terraform.tfstate"
  }
}