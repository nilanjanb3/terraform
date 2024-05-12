variable "subscription_id" {
  type        = string
  description = "value of the Azure Subscription ID"
}
variable "tenant_id" {
  type        = string
  description = "value of the Azure Tenant ID"
}
variable "client_id" {
  type        = string
  description = "value of the Azure Client ID"
}
variable "client_secret" {
  type        = string
  description = "value of the Azure Client Secret"
}
# variable "tfstate_rg_name" {
#   type        = string
#   description = "value of the terraform state resource group name"
#   default     = "payg-tfstate"

# }
# variable "tfstate_storage_account_name" {
#   type        = string
#   description = "value of the terraform state storage account name"
#   default     = "tfstate87ex8"
# }
# variable "tfstate_container_name" {
#   type        = string
#   description = "value of the terraform state container name"
#   default     = "tfstate"

# }
# variable "tfstate_key" {
#   type        = string
#   description = "value of the terraform state key"
#   default     = "terraform-aks-minimal.tfstate"

# }
variable "ssh_key_name" {
  type        = string
  description = "value of the SSH key name"
  default     = "payg-aks-sshkey"

}
variable "rg_name" {
  type        = string
  description = "value of the resource group name"
  default     = "payg-rg-01"
}
variable "rg_id" {
  type        = string
  description = "value of the resource group id"
  default     = "/subscriptions/fbca2fee-4d29-4fce-b401-4e43892bcadb/resourceGroups/payg-rg-01"

}
variable "azurerm_kubernetes_cluster_name" {
  type        = string
  description = "value of the AKS cluster name"
  default     = "payg-aks-01"
}
variable "azurerm_kubernetes_cluster_dns_prefix" {
  type        = string
  description = "value of the AKS cluster dns prefix"
  default     = "payg-aks-01-dns"
}
variable "rg_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource group."
}

# variable "resource_group_name_prefix" {
#   type        = string
#   default     = "rg"
#   description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
# }

variable "node_count" {
  type        = number
  description = "The initial quantity of nodes for the node pool."
  default     = 2
}
variable "vm_size" {
  type        = string
  description = "value of the virtual machine size"
  default     = "Standard_B2s"

}
variable "msi_id" {
  type        = string
  description = "The Managed Service Identity ID. Set this value if you're running this example using Managed Identity as the authentication method."
  default     = null
}

variable "username" {
  type        = string
  description = "The admin username for the new cluster."
  default     = "azureadmin"
}
