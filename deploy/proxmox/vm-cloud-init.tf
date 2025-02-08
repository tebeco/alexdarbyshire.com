#Custom cloud-init to add qemu-guest-agent and SSH key

resource "proxmox_virtual_environment_file" "cloud_config" {
  provider     = proxmox
  node_name    = var.virtual_environment.node_name
  content_type = "snippets"
  datastore_id = var.virtual_environment.storage_nas 

  source_raw {
    data = templatefile("./cloud-init/cloud-config-multi-vms.yaml.tftpl", {
      username    = var.virtual_environment.vm_user
      password    = var.virtual_environment.vm_password
      pub-key     = trimspace(data.local_file.ssh_public_key.content)

    })

    file_name = "cloud-config-multi-vms.yaml"
  }
}


