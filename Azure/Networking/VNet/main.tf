provider "azurerm" {
  features {}
}
resource "azurerm_network_security_group" "nsg1" {
  name                = "nsg1"
  location            = var.location
  resource_group_name = var.rg_name
  security_rule {
    name                       = "allow-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_security_group" "nsg2" {
  name                = "nsg2"
  location            = var.location
  resource_group_name = var.rg_name
  security_rule {
    name                       = "allow-all-inbound"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "private-subnet-1"
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.nsg1.id
  }

  subnet {
    name           = "public-subnet-1"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg2.id
  }

  tags = {
    environment = "Dev"
  }
}
