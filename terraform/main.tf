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
}

resource "proxmox_vm_qemu" "master-01" {
  target_node = "pve1"
  vmid        = 100
  name        = "master-01.xuhuisun.local"
  desc        = "k8s master node 01"

  clone = "ubuntu-cloud"

  memory  = 3840
  sockets = 1
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "10G"
  }
  ipconfig0 = "ip=192.168.1.250/24,gw=192.168.1.1"
}

resource "proxmox_vm_qemu" "master-02" {
  target_node = "pve1"
  vmid        = 101
  name        = "master-02.xuhuisun.local"
  desc        = "k8s master node 02"

  clone = "ubuntu-cloud"

  memory  = 3840
  sockets = 1
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "10G"
  }
  ipconfig0 = "ip=192.168.1.251/24,gw=192.168.1.1"
}

resource "proxmox_vm_qemu" "master-03" {
  target_node = "pve1"
  vmid        = 102
  name        = "master-03.xuhuisun.local"
  desc        = "k8s master node 03"

  clone = "ubuntu-cloud"

  memory  = 3840
  sockets = 1
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "10G"
  }
  ipconfig0 = "ip=192.168.1.252/24,gw=192.168.1.1"
}
