terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Reference the existing resource group using a data source
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Look up existing ACR
data "azurerm_container_registry" "acr" {
  name                = "bikeshop" # <-- registry name (before .azurecr.io)
  resource_group_name = var.resource_group_name
}

# Attach ACR to AKS
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix

default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

identity {
    type = "SystemAssigned"
  }
}
  
resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "AcrPull"
  scope                = data.azurerm_container_registry.acr.id
}
