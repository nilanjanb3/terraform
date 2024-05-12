# Generate random resource group name
# resource "random_pet" "rg_name" {
#   prefix = var.resource_group_name_prefix
# }

# resource "azurerm_resource_group" "rg" {
#   location = var.resource_group_location
#   name     = random_pet.rg_name.id
# }

# resource "random_pet" "azurerm_kubernetes_cluster_name" {
#   prefix = "cluster"
# }

# resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
#   prefix = "dns"
# }

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = var.rg_location
  name                = var.azurerm_kubernetes_cluster_name
  resource_group_name = var.rg_name
  dns_prefix          = var.azurerm_kubernetes_cluster_dns_prefix
  sku_tier            = "Free"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = var.vm_size
    node_count = var.node_count
  }
  linux_profile {
    admin_username = var.username

    ssh_key {
      key_data = azapi_resource_action.ssh_public_key_gen.output.publicKey
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
}
