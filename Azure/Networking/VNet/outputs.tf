output "virtual_network_id" {
  value = azurerm_virtual_network.vnet1.id

}
output "private_subnet_ids" {
  value = azurerm_virtual_network.vnet1.subnet[*]
}
