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

/* resource "proxmox_vm_qemu" "master-01" { */
/*   target_node = "pve1" */
/*   vmid        = 100 */
/*   name        = "master-01.xuhuisun.local" */
/*   desc        = "k8s master node 01" */

/*   clone = "ubuntu-cloud" */

/*   memory  = 3840 */
/*   sockets = 1 */
/*   cores   = 2 */
/*   cpu     = "" */
/*   scsihw  = "virtio-scsi-pci" */
/*   disk { */
/*     type    = "scsi" */
/*     storage = "local-lvm" */
/*     size    = "30G" */
/*   } */
/*   ipconfig0 = "ip=192.168.50.250/24,gw=192.168.50.1" */
/* } */

/* resource "proxmox_vm_qemu" "master-02" { */
/*   target_node = "pve1" */
/*   vmid        = 101 */
/*   name        = "master-02.xuhuisun.local" */
/*   desc        = "k8s master node 02" */

/*   clone = "ubuntu-cloud" */

/*   memory  = 3840 */
/*   sockets = 1 */
/*   cores   = 2 */
/*   cpu     = "" */
/*   scsihw  = "virtio-scsi-pci" */
/*   disk { */
/*     type    = "scsi" */
/*     storage = "local-lvm" */
/*     size    = "30G" */
/*   } */
/*   ipconfig0 = "ip=192.168.50.251/24,gw=192.168.50.1" */
/* } */

/* resource "proxmox_vm_qemu" "master-03" { */
/*   target_node = "pve1" */
/*   vmid        = 102 */
/*   name        = "master-03.xuhuisun.local" */
/*   desc        = "k8s master node 03" */

/*   clone = "ubuntu-cloud" */

/*   memory  = 3840 */
/*   sockets = 1 */
/*   cores   = 2 */
/*   cpu     = "" */
/*   scsihw  = "virtio-scsi-pci" */
/*   disk { */
/*     type    = "scsi" */
/*     storage = "local-lvm" */
/*     size    = "30G" */
/*   } */
/*   ipconfig0 = "ip=192.168.50.252/24,gw=192.168.50.1" */
/* } */

/* resource "proxmox_vm_qemu" "worker-01" { */
/*   target_node = "pve1" */
/*   vmid        = 103 */
/*   name        = "worker-01.xuhuisun.local" */
/*   desc        = "k8s worker node 01" */

/*   clone = "ubuntu-cloud" */

/*   memory  = 2048 */
/*   sockets = 1 */
/*   cores   = 1 */
/*   cpu     = "" */
/*   scsihw  = "virtio-scsi-pci" */
/*   disk { */
/*     type    = "scsi" */
/*     storage = "local-lvm" */
/*     size    = "30G" */
/*   } */
/*   disk { */
/*     type    = "scsi" */
/*     storage = "slow" */
/*     size    = "100G" */
/*   } */
/*   ipconfig0 = "ip=192.168.50.253/24,gw=192.168.50.1" */
/* } */

/* resource "proxmox_vm_qemu" "worker-02" { */
/*   target_node = "pve1" */
/*   vmid        = 104 */
/*   name        = "worker-02.xuhuisun.local" */
/*   desc        = "k8s worker node 02" */

/*   clone = "ubuntu-cloud" */

/*   memory  = 2048 */
/*   sockets = 1 */
/*   cores   = 1 */
/*   cpu     = "" */
/*   scsihw  = "virtio-scsi-pci" */
/*   disk { */
/*     type    = "scsi" */
/*     storage = "local-lvm" */
/*     size    = "30G" */
/*   } */
/*   disk { */
/*     type    = "scsi" */
/*     storage = "slow" */
/*     size    = "100G" */
/*   } */
/*   ipconfig0 = "ip=192.168.50.254/24,gw=192.168.50.1" */
/* } */

resource "proxmox_vm_qemu" "unifi-cam-proxy" {
  target_node = "pve1"
  vmid        = 105
  name        = "unifi-cam-proxy.xuhuisun.local"
  desc        = "UniFi Camera Proxy"

  clone = "ubuntu-cloud"

  memory  = 1024
  sockets = 1
  cores   = 1
  cpu     = ""
  scsihw  = "virtio-scsi-pci"
  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 30
  }
  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "10G"
  }
  ipconfig0 = "ip=192.168.30.3/24,gw=192.168.30.1"
}
