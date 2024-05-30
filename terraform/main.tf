terraform {
  cloud {
    organization = "ericsun1995"
    workspaces {
      name = "homelab"
    }
  }

  required_providers {
    /* proxmox = { */
    /*   source  = "Telmate/proxmox" */
    /*   version = "2.9.14" */
    /* } */
    proxmox = {
      source  = "thegameprofi/proxmox"
      version = ">= 2.9.15"
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

resource "proxmox_vm_qemu" "master-01" {
  target_node = "pve2"
  vmid        = 201
  name        = "master-01.xuhuisun.local"
  desc        = "k8s master node 01"

  clone   = "noble-server-cloudimg-amd64"
  os_type = "cloud-init"
  onboot  = true

  memory  = 16384
  sockets = 2
  cores   = 2
  cpu     = "x86-64-v3"
  numa    = true
  scsihw  = "virtio-scsi-single"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type     = "scsi"
    storage  = "local-zfs"
    size     = "40G"
    iothread = 1
    ssd      = 1
  }
  ipconfig0 = "ip=192.168.60.201/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "master-02" {
  target_node = "pve2"
  vmid        = 202
  name        = "master-02.xuhuisun.local"
  desc        = "k8s master node 02"

  clone   = "noble-server-cloudimg-amd64"
  os_type = "cloud-init"
  onboot  = true

  memory  = 16384
  sockets = 2
  cores   = 2
  cpu     = "x86-64-v3"
  numa    = true
  scsihw  = "virtio-scsi-single"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type     = "scsi"
    storage  = "local-zfs"
    size     = "40G"
    iothread = 1
    ssd      = 1
  }
  ipconfig0 = "ip=192.168.60.202/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "master-03" {
  target_node = "pve2"
  vmid        = 203
  name        = "master-03.xuhuisun.local"
  desc        = "k8s master node 03"

  clone   = "noble-server-cloudimg-amd64"
  os_type = "cloud-init"
  onboot  = true

  memory  = 16384
  sockets = 2
  cores   = 2
  cpu     = "x86-64-v3"
  numa    = true
  scsihw  = "virtio-scsi-single"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type     = "scsi"
    storage  = "local-zfs"
    size     = "40G"
    iothread = 1
    ssd      = 1
  }
  ipconfig0 = "ip=192.168.60.203/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "worker-01" {
  target_node = "pve2"
  vmid        = 211
  name        = "worker-01.xuhuisun.local"
  desc        = "k8s worker node 01"

  clone   = "noble-server-cloudimg-amd64"
  os_type = "cloud-init"
  onboot  = true

  memory  = 49152
  sockets = 2
  cores   = 4
  cpu     = "x86-64-v3"
  numa    = true
  scsihw  = "virtio-scsi-single"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type     = "scsi"
    storage  = "local-zfs"
    size     = "30G"
    iothread = 1
    ssd      = 1
  }
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "90G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "90G" */
  /*   iothread=1
ssd=1 */
  /* } */
  ipconfig0 = "ip=192.168.60.211/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "worker-02" {
  target_node = "pve2"
  vmid        = 212
  name        = "worker-02.xuhuisun.local"
  desc        = "k8s worker node 02"

  clone   = "noble-server-cloudimg-amd64"
  os_type = "cloud-init"
  onboot  = true

  memory  = 49152
  sockets = 2
  cores   = 4
  cpu     = "x86-64-v3"
  numa    = true
  scsihw  = "virtio-scsi-single"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type     = "scsi"
    storage  = "local-zfs"
    size     = "30G"
    iothread = 1
    ssd      = 1
  }
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "90G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "90G" */
  /*   iothread=1
ssd=1 */
  /* } */
  ipconfig0 = "ip=192.168.60.212/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "worker-03" {
  target_node = "pve2"
  vmid        = 213
  name        = "worker-03.xuhuisun.local"
  desc        = "k8s worker node 03"

  clone   = "noble-server-cloudimg-amd64"
  os_type = "cloud-init"
  onboot  = true

  memory  = 49152
  sockets = 2
  cores   = 4
  cpu     = "x86-64-v3"
  numa    = true
  scsihw  = "virtio-scsi-single"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type     = "scsi"
    storage  = "local-zfs"
    size     = "30G"
    iothread = 1
    ssd      = 1
  }
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "90G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "90G" */
  /*   iothread=1
ssd=1 */
  /* } */
  ipconfig0 = "ip=192.168.60.213/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "worker-04" {
  target_node = "pve2"
  vmid        = 214
  name        = "worker-04.xuhuisun.local"
  desc        = "k8s worker node 04"

  clone   = "noble-server-cloudimg-amd64"
  os_type = "cloud-init"
  onboot  = true

  memory  = 49152
  sockets = 2
  cores   = 4
  cpu     = "x86-64-v3"
  numa    = true
  scsihw  = "virtio-scsi-single"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type     = "scsi"
    storage  = "local-zfs"
    size     = "30G"
    iothread = 1
    ssd      = 1
  }
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "90G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "90G" */
  /*   iothread=1
ssd=1 */
  /* } */
  ipconfig0 = "ip=192.168.60.214/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "worker-05" {
  target_node = "pve2"
  vmid        = 215
  name        = "worker-05.xuhuisun.local"
  desc        = "k8s worker node 05"

  clone   = "noble-server-cloudimg-amd64"
  os_type = "cloud-init"
  onboot  = true

  memory  = 49152
  sockets = 2
  cores   = 4
  cpu     = "x86-64-v3"
  numa    = true
  scsihw  = "virtio-scsi-single"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 60
  }
  disk {
    type     = "scsi"
    storage  = "local-zfs"
    size     = "30G"
    iothread = 1
    ssd      = 1
  }
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "40G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "90G" */
  /*   iothread=1
ssd=1 */
  /* } */
  /* disk { */
  /*   type    = "scsi" */
  /*   storage = "local-zfs" */
  /*   size    = "90G" */
  /*   iothread=1
ssd=1 */
  /* } */
  ipconfig0 = "ip=192.168.60.215/24,gw=192.168.60.1"
}

resource "proxmox_vm_qemu" "scrypted" {
  target_node = "pve2"
  vmid        = 221
  name        = "scrypted.xuhuisun.local"
  desc        = "Scrypted"

  clone   = "noble-server-cloudimg-amd64"
  os_type = "cloud-init"
  onboot  = true

  memory  = 1024
  sockets = 1
  cores   = 1
  cpu     = "x86-64-v3"
  numa    = true
  scsihw  = "virtio-scsi-single"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 20
  }
  disk {
    type     = "scsi"
    storage  = "local-zfs"
    size     = "10G"
    iothread = 1
    ssd      = 1
    volume   = "local-zfs:vm-221-disk-0"
  }
  ipconfig0 = "ip=192.168.20.221/24,gw=192.168.20.1"
}
