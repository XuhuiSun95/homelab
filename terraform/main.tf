terraform {
  cloud {
    organization = "ericsun1995"
    workspaces {
      name = "homelab"
    }
  }

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.70.1"
    }
  }
}

variable "virtual_environment_endpoint" {
  type = string
}

variable "virtual_environment_username" {
  type      = string
  sensitive = true
}

variable "virtual_environment_password" {
  type      = string
  sensitive = true
}

variable "virtual_environment_ssh_username" {
  type      = string
  sensitive = true
}

provider "proxmox" {
  endpoint = var.virtual_environment_endpoint
  username = var.virtual_environment_username
  password = var.virtual_environment_password
  insecure = true

  ssh {
    agent    = true
    username = var.virtual_environment_ssh_username
  }
}

#resource "proxmox_vm_qemu" "master-01" {
#  target_node = "pve2"
#  vmid        = 201
#  name        = "master-01.xuhuisun.local"
#  desc        = "k8s master node 01"
#
#  clone   = "noble-server-cloudimg-amd64"
#  os_type = "cloud-init"
#  onboot  = true
#
#  memory  = 16384
#  sockets = 2
#  cores   = 2
#  cpu     = "x86-64-v3"
#  numa    = true
#  scsihw  = "virtio-scsi-single"
#  network {
#    model  = "virtio"
#    bridge = "vmbr0"
#    tag    = 60
#  }
#  disk {
#    type     = "scsi"
#    storage  = "local-zfs"
#    size     = "40G"
#    iothread = 1
#    ssd      = 1
#  }
#  ipconfig0 = "ip=192.168.60.201/24,gw=192.168.60.1"
#}
#
#resource "proxmox_vm_qemu" "master-02" {
#  target_node = "pve2"
#  vmid        = 202
#  name        = "master-02.xuhuisun.local"
#  desc        = "k8s master node 02"
#
#  clone   = "noble-server-cloudimg-amd64"
#  os_type = "cloud-init"
#  onboot  = true
#
#  memory  = 16384
#  sockets = 2
#  cores   = 2
#  cpu     = "x86-64-v3"
#  numa    = true
#  scsihw  = "virtio-scsi-single"
#  network {
#    model  = "virtio"
#    bridge = "vmbr0"
#    tag    = 60
#  }
#  disk {
#    type     = "scsi"
#    storage  = "local-zfs"
#    size     = "40G"
#    iothread = 1
#    ssd      = 1
#  }
#  ipconfig0 = "ip=192.168.60.202/24,gw=192.168.60.1"
#}
#
#resource "proxmox_vm_qemu" "master-03" {
#  target_node = "pve2"
#  vmid        = 203
#  name        = "master-03.xuhuisun.local"
#  desc        = "k8s master node 03"
#
#  clone   = "noble-server-cloudimg-amd64"
#  os_type = "cloud-init"
#  onboot  = true
#
#  memory  = 16384
#  sockets = 2
#  cores   = 2
#  cpu     = "x86-64-v3"
#  numa    = true
#  scsihw  = "virtio-scsi-single"
#  network {
#    model  = "virtio"
#    bridge = "vmbr0"
#    tag    = 60
#  }
#  disk {
#    type     = "scsi"
#    storage  = "local-zfs"
#    size     = "40G"
#    iothread = 1
#    ssd      = 1
#  }
#  ipconfig0 = "ip=192.168.60.203/24,gw=192.168.60.1"
#}
#
#resource "proxmox_vm_qemu" "worker-01" {
#  target_node = "pve2"
#  vmid        = 211
#  name        = "worker-01.xuhuisun.local"
#  desc        = "k8s worker node 01"
#
#  clone   = "noble-server-cloudimg-amd64"
#  os_type = "cloud-init"
#  onboot  = true
#
#  memory  = 49152
#  sockets = 2
#  cores   = 4
#  cpu     = "x86-64-v3"
#  numa    = true
#  scsihw  = "virtio-scsi-single"
#  network {
#    model  = "virtio"
#    bridge = "vmbr0"
#    tag    = 60
#  }
#  disk {
#    type     = "scsi"
#    storage  = "local-zfs"
#    size     = "30G"
#    iothread = 1
#    ssd      = 1
#  }
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "90G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "90G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  ipconfig0 = "ip=192.168.60.211/24,gw=192.168.60.1"
#}
#
#resource "proxmox_vm_qemu" "worker-02" {
#  target_node = "pve2"
#  vmid        = 212
#  name        = "worker-02.xuhuisun.local"
#  desc        = "k8s worker node 02"
#
#  clone   = "noble-server-cloudimg-amd64"
#  os_type = "cloud-init"
#  onboot  = true
#
#  memory  = 49152
#  sockets = 2
#  cores   = 4
#  cpu     = "x86-64-v3"
#  numa    = true
#  scsihw  = "virtio-scsi-single"
#  network {
#    model  = "virtio"
#    bridge = "vmbr0"
#    tag    = 60
#  }
#  disk {
#    type     = "scsi"
#    storage  = "local-zfs"
#    size     = "30G"
#    iothread = 1
#    ssd      = 1
#  }
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "90G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "90G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  ipconfig0 = "ip=192.168.60.212/24,gw=192.168.60.1"
#}
#
#resource "proxmox_vm_qemu" "worker-03" {
#  target_node = "pve2"
#  vmid        = 213
#  name        = "worker-03.xuhuisun.local"
#  desc        = "k8s worker node 03"
#
#  clone   = "noble-server-cloudimg-amd64"
#  os_type = "cloud-init"
#  onboot  = true
#
#  memory  = 49152
#  sockets = 2
#  cores   = 4
#  cpu     = "x86-64-v3"
#  numa    = true
#  scsihw  = "virtio-scsi-single"
#  network {
#    model  = "virtio"
#    bridge = "vmbr0"
#    tag    = 60
#  }
#  disk {
#    type     = "scsi"
#    storage  = "local-zfs"
#    size     = "30G"
#    iothread = 1
#    ssd      = 1
#  }
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "90G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "90G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  ipconfig0 = "ip=192.168.60.213/24,gw=192.168.60.1"
#}
#
#resource "proxmox_vm_qemu" "worker-04" {
#  target_node = "pve2"
#  vmid        = 214
#  name        = "worker-04.xuhuisun.local"
#  desc        = "k8s worker node 04"
#
#  clone   = "noble-server-cloudimg-amd64"
#  os_type = "cloud-init"
#  onboot  = true
#
#  memory  = 49152
#  sockets = 2
#  cores   = 4
#  cpu     = "x86-64-v3"
#  numa    = true
#  scsihw  = "virtio-scsi-single"
#  network {
#    model  = "virtio"
#    bridge = "vmbr0"
#    tag    = 60
#  }
#  disk {
#    type     = "scsi"
#    storage  = "local-zfs"
#    size     = "30G"
#    iothread = 1
#    ssd      = 1
#  }
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "90G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "90G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  ipconfig0 = "ip=192.168.60.214/24,gw=192.168.60.1"
#}
#
#resource "proxmox_vm_qemu" "worker-05" {
#  target_node = "pve2"
#  vmid        = 215
#  name        = "worker-05.xuhuisun.local"
#  desc        = "k8s worker node 05"
#
#  clone   = "noble-server-cloudimg-amd64"
#  os_type = "cloud-init"
#  onboot  = true
#
#  memory  = 49152
#  sockets = 2
#  cores   = 4
#  cpu     = "x86-64-v3"
#  numa    = true
#  scsihw  = "virtio-scsi-single"
#  network {
#    model  = "virtio"
#    bridge = "vmbr0"
#    tag    = 60
#  }
#  disk {
#    type     = "scsi"
#    storage  = "local-zfs"
#    size     = "30G"
#    iothread = 1
#    ssd      = 1
#  }
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "40G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "90G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  /* disk { */
#  /*   type    = "scsi" */
#  /*   storage = "local-zfs" */
#  /*   size    = "90G" */
#  /*   iothread=1
#ssd=1 */
#  /* } */
#  ipconfig0 = "ip=192.168.60.215/24,gw=192.168.60.1"
#}
#
#resource "proxmox_vm_qemu" "scrypted" {
#  target_node = "pve2"
#  vmid        = 221
#  name        = "scrypted.xuhuisun.local"
#  desc        = "Scrypted"
#
#  clone   = "noble-server-cloudimg-amd64"
#  os_type = "cloud-init"
#  onboot  = true
#
#  memory  = 1024
#  sockets = 1
#  cores   = 1
#  cpu     = "x86-64-v3"
#  numa    = true
#  scsihw  = "virtio-scsi-single"
#  network {
#    model  = "virtio"
#    bridge = "vmbr0"
#    tag    = 20
#  }
#  disk {
#    type     = "scsi"
#    storage  = "local-zfs"
#    size     = "10G"
#    iothread = 1
#    ssd      = 1
#    volume   = "local-zfs:vm-221-disk-0"
#  }
#  ipconfig0 = "ip=192.168.20.221/24,gw=192.168.20.1"
#}

data "local_file" "ssh_public_key" {
  filename = "./id_rsa.pub"
}

resource "proxmox_virtual_environment_vm" "master-01_k8s" {
  name        = "master-01.k8s.xuhuisun.local"
  description = "master node 01 - k8s cluster"
  tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-24-noble-qcow2", "type_k8s", "type-k8s-role_control-plane"]

  node_name = "pve2"
  vm_id     = 150

  agent {
    enabled = true
  }

  startup {
    order = "1"
  }

  cpu {
    cores   = 2
    numa    = true
    sockets = 2
    type    = "host"
  }

  memory {
    dedicated = 8192
    floating  = 8192
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_24_noble_qcow2_image.id
    interface    = "scsi0"
    iothread     = true
    discard      = "on"
    size         = 40
    ssd          = true
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "192.168.60.150/24"
        gateway = "192.168.60.1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge  = "vmbr0"
    vlan_id = 60
    mtu = 1
  }

  operating_system {
    type = "l26"
  }

  scsi_hardware = "virtio-scsi-single"

  tpm_state {
    datastore_id = "local-zfs"
    version      = "v2.0"
  }
}

resource "proxmox_virtual_environment_vm" "master-02_k8s" {
  name        = "master-02.k8s.xuhuisun.local"
  description = "master node 02 - k8s cluster"
  tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-24-noble-qcow2", "type_k8s", "type-k8s-role_control-plane"]

  node_name = "pve2"
  vm_id     = 151

  agent {
    enabled = true
  }

  startup {
    order = "1"
  }

  cpu {
    cores   = 2
    numa    = true
    sockets = 2
    type    = "host"
  }

  memory {
    dedicated = 8192
    floating  = 8192
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_24_noble_qcow2_image.id
    interface    = "scsi0"
    iothread     = true
    discard      = "on"
    size         = 40
    ssd          = true
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "192.168.60.151/24"
        gateway = "192.168.60.1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge  = "vmbr0"
    vlan_id = 60
    mtu = 1
  }

  operating_system {
    type = "l26"
  }

  scsi_hardware = "virtio-scsi-single"

  tpm_state {
    datastore_id = "local-zfs"
    version      = "v2.0"
  }
}

resource "proxmox_virtual_environment_vm" "master-03_k8s" {
  name        = "master-03.k8s.xuhuisun.local"
  description = "master node 03 - k8s cluster"
  tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-24-noble-qcow2", "type_k8s", "type-k8s-role_control-plane"]

  node_name = "pve2"
  vm_id     = 152

  agent {
    enabled = true
  }

  startup {
    order = "1"
  }

  cpu {
    cores   = 2
    numa    = true
    sockets = 2
    type    = "host"
  }

  memory {
    dedicated = 8192
    floating  = 8192
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_virtual_environment_download_file.ubuntu_24_noble_qcow2_image.id
    interface    = "scsi0"
    iothread     = true
    discard      = "on"
    size         = 40
    ssd          = true
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "192.168.60.152/24"
        gateway = "192.168.60.1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge  = "vmbr0"
    vlan_id = 60
    mtu = 1
  }

  operating_system {
    type = "l26"
  }

  scsi_hardware = "virtio-scsi-single"

  tpm_state {
    datastore_id = "local-zfs"
    version      = "v2.0"
  }
}

resource "proxmox_virtual_environment_download_file" "ubuntu_24_noble_qcow2_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "pve2"

  url = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}
