terraform {
  cloud {
    organization = "ericsun1995"
    workspaces {
      name = "homelab"
    }
  }

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

variable "proxmox_api_url" {
  type = string
}

variable "proxmox_user" {
  type      = string
  sensitive = true
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

provider "proxmox" {
  pm_api_url  = var.proxmox_api_url
  pm_user     = var.proxmox_user
  pm_password = var.proxmox_password

  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_debug      = true
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

resource "proxmox_vm_qemu" "heimdall" {
  target_node = "pve1"
  vmid        = 105
  name        = "heimdall.xuhuisun.local"
  desc        = "Heimdall Application Dashboard"

  clone  = "ubuntu-cloud"
  onboot = true

  memory  = 1024
  sockets = 1
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 50
  }
  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "10G"
  }
  ipconfig0 = "ip=192.168.50.241/24,gw=192.168.50.1"
}

resource "proxmox_vm_qemu" "uptime-kuma" {
  target_node = "pve1"
  vmid        = 106
  name        = "uptime-kuma.xuhuisun.local"
  desc        = "Uptime Kuma"

  clone  = "ubuntu-cloud"
  onboot = true

  memory  = 1024
  sockets = 1
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 50
  }
  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "10G"
  }
  ipconfig0 = "ip=192.168.50.242/24,gw=192.168.50.1"
}

resource "proxmox_vm_qemu" "homeassistant" {
  target_node = "pve1"
  vmid        = 107
  name        = "homeassistant.xuhuisun.local"
  desc        = "Home Assistant"

  clone = "ubuntu-cloud"

  memory  = 2048
  sockets = 1
  cores   = 2
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 50
  }
  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "40G"
  }
  ipconfig0 = "ip=192.168.50.243/24,gw=192.168.50.1"
}

resource "proxmox_vm_qemu" "scrypted" {
  target_node = "pve1"
  vmid        = 108
  name        = "scrypted.xuhuisun.local"
  desc        = "Scrypted"

  clone = "ubuntu-cloud"

  memory  = 1024
  sockets = 1
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 50
  }
  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "10G"
  }
  ipconfig0 = "ip=192.168.50.244/24,gw=192.168.50.1"
}

resource "proxmox_vm_qemu" "traefik" {
  target_node = "pve1"
  vmid        = 109
  name        = "traefik.xuhuisun.local"
  desc        = "Traefik proxy"

  clone  = "ubuntu-cloud"
  onboot = true

  memory  = 1024
  sockets = 1
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 50
  }
  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "10G"
  }
  ipconfig0 = "ip=192.168.50.245/24,gw=192.168.50.1"
}

resource "proxmox_vm_qemu" "master-01" {
  target_node = "pve2"
  vmid        = 201
  name        = "master-01.xuhuisun.local"
  desc        = "k8s master node 01"

  clone  = "ubuntu-cloud-2"
  onboot = true

  memory  = 16384
  sockets = 2
  cores   = 2
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type    = "scsi"
    storage = "local-zfs"
    size    = "40G"
  }
  ipconfig0 = "ip=192.168.60.201/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "master-02" {
  target_node = "pve2"
  vmid        = 202
  name        = "master-02.xuhuisun.local"
  desc        = "k8s master node 02"

  clone  = "ubuntu-cloud-2"
  onboot = true

  memory  = 16384
  sockets = 2
  cores   = 2
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type    = "scsi"
    storage = "local-zfs"
    size    = "40G"
  }
  ipconfig0 = "ip=192.168.60.202/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "master-03" {
  target_node = "pve2"
  vmid        = 203
  name        = "master-03.xuhuisun.local"
  desc        = "k8s master node 03"

  clone  = "ubuntu-cloud-2"
  onboot = true

  memory  = 16384
  sockets = 2
  cores   = 2
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type    = "scsi"
    storage = "local-zfs"
    size    = "40G"
  }
  ipconfig0 = "ip=192.168.60.203/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "worker-01" {
  target_node = "pve2"
  vmid        = 211
  name        = "worker-01.xuhuisun.local"
  desc        = "k8s worker node 01"

  clone  = "ubuntu-cloud-2"
  onboot = true

  memory  = 8192
  sockets = 2
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type    = "scsi"
    storage = "local-zfs"
    size    = "30G"
  }
  ipconfig0 = "ip=192.168.60.211/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "worker-02" {
  target_node = "pve2"
  vmid        = 212
  name        = "worker-02.xuhuisun.local"
  desc        = "k8s worker node 02"

  clone  = "ubuntu-cloud-2"
  onboot = true

  memory  = 8192
  sockets = 2
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type    = "scsi"
    storage = "local-zfs"
    size    = "30G"
  }
  ipconfig0 = "ip=192.168.60.212/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "worker-03" {
  target_node = "pve2"
  vmid        = 213
  name        = "worker-03.xuhuisun.local"
  desc        = "k8s worker node 03"

  clone  = "ubuntu-cloud-2"
  onboot = true

  memory  = 8192
  sockets = 2
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type    = "scsi"
    storage = "local-zfs"
    size    = "30G"
  }
  ipconfig0 = "ip=192.168.60.213/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "worker-04" {
  target_node = "pve2"
  vmid        = 214
  name        = "worker-04.xuhuisun.local"
  desc        = "k8s worker node 04"

  clone = "ubuntu-cloud-2"

  memory  = 8192
  sockets = 2
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type    = "scsi"
    storage = "local-zfs"
    size    = "30G"
  }
  ipconfig0 = "ip=192.168.60.214/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "worker-05" {
  target_node = "pve2"
  vmid        = 215
  name        = "worker-05.xuhuisun.local"
  desc        = "k8s worker node 05"

  clone = "ubuntu-cloud-2"

  memory  = 8192
  sockets = 2
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type    = "scsi"
    storage = "local-zfs"
    size    = "30G"
  }
  ipconfig0 = "ip=192.168.60.215/24,gw=192.168.60.1"
}
