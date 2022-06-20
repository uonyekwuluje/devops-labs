resource "proxmox_vm_qemu" "prometheus" {
    name = "prometheus"
    
    target_node = var.proxmox_host
    clone = var.template_name

    agent = 1
    os_type = "cloud-init"
    cores = 1
    sockets = 1
    cpu = "host"
    memory = "2048"
    scsihw = "virtio-scsi-pci"
    bootdisk = "scsi0"
    
    disk {
      slot = 0
      size = "25G"
      type = "scsi"
      storage = "vm_storage_01"
      iothread = 1
    }

    network {
      model = "virtio"
      bridge = "vmbr0"
    }

    lifecycle {
       ignore_changes = [
          network
       ]
    }

    cloudinit_cdrom_storage = "vm_storage_01"
    ipconfig0 = "ip=dhcp"
    ciuser = var.username
    cipassword = var.password
    cicustom = "vendor=local:snippets/cloud_init_redhat.yml"
    ssh_user = var.username
    sshkeys = <<EOF
    ${var.ssh_key}
    EOF
}
#
#resource "proxmox_vm_qemu" "test_VM" {
#    count = 0
#    name = "servernode-0${count.index + 1}"
#
#    target_node = var.proxmox_host
#    clone = var.template_name
#
#    agent = 1
#    os_type = "cloud-init"
#    cores = 1
#    sockets = 1
#    cpu = "host"
#    memory = "2048"
#    scsihw = "virtio-scsi-pci"
#    bootdisk = "scsi0"
#
#    disk {
#      slot = 0
#      size = "32G"
#      type = "scsi"
#      storage = "vm_storage_01"
#      iothread = 1
#    }
#
#    network {
#      model = "virtio"
#      bridge = "vmbr0"
#    }
#
#    ipconfig0 = "ip=dhcp"
#    ciuser = var.username
#    cipassword = var.password
#    sshkeys = <<EOF
#    ${var.ssh_key}
#    EOF
#}
