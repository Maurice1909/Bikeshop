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

# Create the Azure Kubernetes Service (AKS) cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix

  # Define the default node pool for the cluster
  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  # Use a system-assigned managed identity for the cluster
  identity {
    type = "SystemAssigned"
  }
}