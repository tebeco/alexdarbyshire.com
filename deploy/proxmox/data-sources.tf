#Load local SSH key for injecting into VMs
data "local_file" "ssh_public_key" {
  filename = pathexpand(var.virtual_environment.vm_ssh_public_keyfile)
}


