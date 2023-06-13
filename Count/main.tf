resource "azurerm_resource_group" "rg" {

    name = var.rgname
    location=var.loc 

}

resource "azurerm_virtual_network" "vnet" {

    name = var.vname 
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name  
    address_space = ["172.29.0.0/16"]
  
}
resource "azurerm_subnet" "sub" {
  count = 2
  name = "subnet-${count.index}"
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name = azurerm_resource_group.rg.name
  address_prefixes = ["172.29.${count.index}.0/24"]
}
