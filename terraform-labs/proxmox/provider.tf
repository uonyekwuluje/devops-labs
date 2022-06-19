terraform {
  required_version = ">= 1.2.2"
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.10"
    }
  }
}


provider "proxmox" {
  pm_api_url        = "https://${var.prx_address}:${var.prx_port}/api2/json"
  pm_user           = var.prx_username
  pm_password       = var.prx_password
  pm_parallel       = 1
  pm_tls_insecure   = true
}
