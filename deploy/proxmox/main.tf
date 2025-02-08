terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.50.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.virtual_environment.endpoint
  insecure = true 				# Using self-signed TLS certificate currently
  username = var.virtual_environment.username
  api_token = var.virtual_environment.api_token

  ssh {
    agent = true
    username = var.virtual_environment.username
  }

}

