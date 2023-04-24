provider "azurerm" {
  features {}

}
resource "azurerm_public_ip" "pip1" {
  name                    = "pip1"
  location                = var.location
  resource_group_name     = var.rg_name
  allocation_method       = "Static"
  idle_timeout_in_minutes = 30

  tags = {
    environment = "Dev"
  }
}
resource "azurerm_network_interface" "nic1" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.public_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip1.id
  }
}

resource "azurerm_linux_virtual_machine" "vm1" {
  name                            = "vm1"
  resource_group_name             = var.rg_name
  location                        = var.location
  size                            = "Standard_B2s"
  admin_username                  = "nilanjan"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic1.id,
  ]
  admin_password = var.vm_password
  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "20.04-LTS"
    version   = "latest"
  }
}
