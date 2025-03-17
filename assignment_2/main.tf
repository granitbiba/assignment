# Added custom a Virtual Network

resource "azurerm_resource_group" "main" {
  name     = "SolaborateRG"
  location = "North Europe"
}

module "avm-res-network-virtualnetwork" {
  source = "Azure/avm-res-network-virtualnetwork/azurerm"

  address_space       = ["10.0.0.0/16"]
  location            = "North Europe"
  name                = "SolaborateVNet"
  resource_group_name = azurerm_resource_group.main.name
  subnets = {
    "subnet1" = {
      name                                          = "solaborate_private"
      address_prefixes                              = ["10.0.0.0/24"]
      service_endpoints                             = ["Microsoft.Storage"]
      private_endpoint_network_policies_enabled     = false
      private_link_service_network_policies_enabled = false
    }
    "subnet2" = {
      name             = "solaborate_public"
      address_prefixes = ["10.0.1.0/24"]
    }
  }
  depends_on = [azurerm_resource_group.main]
}