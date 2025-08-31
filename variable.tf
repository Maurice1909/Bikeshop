variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "MyBikeShopResourceGroup"
}

variable "location" {
  description = "The Azure region to create the resources in."
  type        = string
  default     = "East US"
}

variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
  default     = "bike-shop-aks"
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
  default     = "bikeshop"
}

variable "node_count" {
  description = "The number of nodes in the node pool."
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "The size of the virtual machines for the nodes."
  type        = string
  default     = "Standard_DS2_v2"
}