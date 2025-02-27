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
      version = "0.73.0"
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

data "local_file" "ssh_public_key" {
  filename = "./id_rsa.pub"
}

resource "proxmox_virtual_environment_vm" "control-plane-01_k8s" {
  name        = "control-plane-01.k8s.xuhuisun.local"
  description = "control plane node 01 - k8s cluster"
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
    size         = 30
    ssd          = true
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "192.168.60.150/24"
        gateway = "192.168.60.1"
      }
      ipv6 {
        address = "2600:8801:2aa0:b305:be24:11ff:fe8b:ad14/64"
        gateway = "2600:8801:2aa0:b305::1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge      = "vmbr0"
    vlan_id     = 60
    mac_address = "BC:24:11:8B:AD:14"
    mtu         = 1
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

resource "proxmox_virtual_environment_vm" "control-plane-02_k8s" {
  name        = "control-plane-02.k8s.xuhuisun.local"
  description = "control plane node 02 - k8s cluster"
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
    size         = 30
    ssd          = true
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "192.168.60.151/24"
        gateway = "192.168.60.1"
      }
      ipv6 {
        address = "2600:8801:2aa0:b305:be24:11ff:fe1a:7805/64"
        gateway = "2600:8801:2aa0:b305::1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge      = "vmbr0"
    vlan_id     = 60
    mac_address = "BC:24:11:1A:78:05"
    mtu         = 1
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

resource "proxmox_virtual_environment_vm" "control-plane-03_k8s" {
  name        = "control-plane-03.k8s.xuhuisun.local"
  description = "control plane node 03 - k8s cluster"
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
    size         = 30
    ssd          = true
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "192.168.60.152/24"
        gateway = "192.168.60.1"
      }
      ipv6 {
        address = "2600:8801:2aa0:b305:be24:11ff:fe28:cbeb/64"
        gateway = "2600:8801:2aa0:b305::1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge      = "vmbr0"
    vlan_id     = 60
    mac_address = "BC:24:11:28:CB:EB"
    mtu         = 1
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

resource "proxmox_virtual_environment_vm" "system-01_k8s" {
  name        = "system-01.k8s.xuhuisun.local"
  description = "system node 01 - k8s cluster"
  tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-24-noble-qcow2", "type_k8s", "type-k8s-role_system"]

  node_name = "pve2"
  vm_id     = 155

  agent {
    enabled = true
  }

  startup {
    order = "2"
  }

  cpu {
    cores   = 4
    numa    = true
    sockets = 2
    type    = "host"
  }

  memory {
    dedicated = 16384
    floating  = 16384
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
        address = "192.168.60.155/24"
        gateway = "192.168.60.1"
      }
      ipv6 {
        address = "2600:8801:2aa0:b305:be24:11ff:fe0c:dcf2/64"
        gateway = "2600:8801:2aa0:b305::1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge      = "vmbr0"
    vlan_id     = 60
    mac_address = "BC:24:11:0C:DC:F2"
    mtu         = 1
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

resource "proxmox_virtual_environment_vm" "system-02_k8s" {
  name        = "system-02.k8s.xuhuisun.local"
  description = "system node 02 - k8s cluster"
  tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-24-noble-qcow2", "type_k8s", "type-k8s-role_system"]

  node_name = "pve2"
  vm_id     = 156

  agent {
    enabled = true
  }

  startup {
    order = "2"
  }

  cpu {
    cores   = 4
    numa    = true
    sockets = 2
    type    = "host"
  }

  memory {
    dedicated = 16384
    floating  = 16384
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
        address = "192.168.60.156/24"
        gateway = "192.168.60.1"
      }
      ipv6 {
        address = "2600:8801:2aa0:b305:be24:11ff:fe2e:f049/64"
        gateway = "2600:8801:2aa0:b305::1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge      = "vmbr0"
    vlan_id     = 60
    mac_address = "BC:24:11:2E:F0:49"
    mtu         = 1
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

resource "proxmox_virtual_environment_vm" "system-03_k8s" {
  name        = "system-03.k8s.xuhuisun.local"
  description = "system node 03 - k8s cluster"
  tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-24-noble-qcow2", "type_k8s", "type-k8s-role_system"]

  node_name = "pve2"
  vm_id     = 157

  agent {
    enabled = true
  }

  startup {
    order = "2"
  }

  cpu {
    cores   = 4
    numa    = true
    sockets = 2
    type    = "host"
  }

  memory {
    dedicated = 16384
    floating  = 16384
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
        address = "192.168.60.157/24"
        gateway = "192.168.60.1"
      }
      ipv6 {
        address = "2600:8801:2aa0:b305:be24:11ff:fe52:ebe8/64"
        gateway = "2600:8801:2aa0:b305::1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge      = "vmbr0"
    vlan_id     = 60
    mac_address = "BC:24:11:52:EB:E8"
    mtu         = 1
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

resource "proxmox_virtual_environment_vm" "user-01_k8s" {
  name        = "user-01.k8s.xuhuisun.local"
  description = "user node 01 - k8s cluster"
  tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-24-noble-qcow2", "type_k8s", "type-k8s-role_user"]

  node_name = "pve2"
  vm_id     = 160

  agent {
    enabled = true
  }

  startup {
    order = "3"
  }

  cpu {
    cores   = 4
    numa    = true
    sockets = 2
    type    = "host"
  }

  memory {
    dedicated = 32768
    floating  = 32768
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

  disk {
    datastore_id = "local-zfs"
    file_format  = "raw"
    interface    = "scsi1"
    iothread     = true
    discard      = "on"
    size         = 200
    ssd          = true
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "192.168.60.160/24"
        gateway = "192.168.60.1"
      }
      ipv6 {
        address = "2600:8801:2aa0:b305:be24:11ff:fe53:58b9/64"
        gateway = "2600:8801:2aa0:b305::1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge      = "vmbr0"
    vlan_id     = 60
    trunks      = "60;1610"
    mac_address = "BC:24:11:53:58:B9"
    mtu         = 1
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

resource "proxmox_virtual_environment_vm" "user-02_k8s" {
  name        = "user-02.k8s.xuhuisun.local"
  description = "user node 02 - k8s cluster"
  tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-24-noble-qcow2", "type_k8s", "type-k8s-role_user"]

  node_name = "pve2"
  vm_id     = 161

  agent {
    enabled = true
  }

  startup {
    order = "3"
  }

  cpu {
    cores   = 4
    numa    = true
    sockets = 2
    type    = "host"
  }

  memory {
    dedicated = 32768
    floating  = 32768
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

  disk {
    datastore_id = "local-zfs"
    file_format  = "raw"
    interface    = "scsi1"
    iothread     = true
    discard      = "on"
    size         = 200
    ssd          = true
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "192.168.60.161/24"
        gateway = "192.168.60.1"
      }
      ipv6 {
        address = "2600:8801:2aa0:b305:be24:11ff:feed:8783/64"
        gateway = "2600:8801:2aa0:b305::1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge      = "vmbr0"
    vlan_id     = 60
    trunks      = "60;1610"
    mac_address = "BC:24:11:ED:87:83"
    mtu         = 1
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

resource "proxmox_virtual_environment_vm" "user-03_k8s" {
  name        = "user-03.k8s.xuhuisun.local"
  description = "user node 03 - k8s cluster"
  tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-24-noble-qcow2", "type_k8s", "type-k8s-role_user"]

  node_name = "pve2"
  vm_id     = 162

  agent {
    enabled = true
  }

  startup {
    order = "3"
  }

  cpu {
    cores   = 4
    numa    = true
    sockets = 2
    type    = "host"
  }

  memory {
    dedicated = 32768
    floating  = 32768
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

  disk {
    datastore_id = "local-zfs"
    file_format  = "raw"
    interface    = "scsi1"
    iothread     = true
    discard      = "on"
    size         = 200
    ssd          = true
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "192.168.60.162/24"
        gateway = "192.168.60.1"
      }
      ipv6 {
        address = "2600:8801:2aa0:b305:be24:11ff:fee0:31c2/64"
        gateway = "2600:8801:2aa0:b305::1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge      = "vmbr0"
    vlan_id     = 60
    trunks      = "60;1610"
    mac_address = "BC:24:11:E0:31:C2"
    mtu         = 1
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

resource "proxmox_virtual_environment_vm" "user-04_k8s" {
  name        = "user-04.k8s.xuhuisun.local"
  description = "user node 04 - k8s cluster"
  tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-24-noble-qcow2", "type_k8s", "type-k8s-role_user"]

  node_name = "pve2"
  vm_id     = 163

  agent {
    enabled = true
  }

  startup {
    order = "3"
  }

  cpu {
    cores   = 4
    numa    = true
    sockets = 2
    type    = "host"
  }

  memory {
    dedicated = 32768
    floating  = 32768
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

  disk {
    datastore_id = "local-zfs"
    file_format  = "raw"
    interface    = "scsi1"
    iothread     = true
    discard      = "on"
    size         = 200
    ssd          = true
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "192.168.60.163/24"
        gateway = "192.168.60.1"
      }
      ipv6 {
        address = "2600:8801:2aa0:b305:be24:11ff:fed9:fbd5/64"
        gateway = "2600:8801:2aa0:b305::1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge      = "vmbr0"
    vlan_id     = 60
    trunks      = "60;1610"
    mac_address = "BC:24:11:D9:FB:D5"
    mtu         = 1
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

resource "proxmox_virtual_environment_vm" "user-05_k8s" {
  name        = "user-05.k8s.xuhuisun.local"
  description = "user node 05 - k8s cluster"
  tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-24-noble-qcow2", "type_k8s", "type-k8s-role_user"]

  node_name = "pve2"
  vm_id     = 164

  agent {
    enabled = true
  }

  startup {
    order = "3"
  }

  cpu {
    cores   = 4
    numa    = true
    sockets = 2
    type    = "host"
  }

  memory {
    dedicated = 32768
    floating  = 32768
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

  disk {
    datastore_id = "local-zfs"
    file_format  = "raw"
    interface    = "scsi1"
    iothread     = true
    discard      = "on"
    size         = 200
    ssd          = true
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "192.168.60.164/24"
        gateway = "192.168.60.1"
      }
      ipv6 {
        address = "2600:8801:2aa0:b305:be24:11ff:fe5a:dd59/64"
        gateway = "2600:8801:2aa0:b305::1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge      = "vmbr0"
    vlan_id     = 60
    trunks      = "60;1610"
    mac_address = "BC:24:11:5A:DD:59"
    mtu         = 1
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

resource "proxmox_virtual_environment_vm" "user-06_k8s" {
  name        = "user-06.k8s.xuhuisun.local"
  description = "user node 06 - k8s cluster"
  tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-24-noble-qcow2", "type_k8s", "type-k8s-role_user"]

  node_name = "pve2"
  vm_id     = 165

  agent {
    enabled = true
  }

  startup {
    order = "3"
  }

  cpu {
    cores   = 4
    numa    = true
    sockets = 2
    type    = "host"
  }

  memory {
    dedicated = 32768
    floating  = 32768
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

  disk {
    datastore_id = "local-zfs"
    file_format  = "raw"
    interface    = "scsi1"
    iothread     = true
    discard      = "on"
    size         = 200
    ssd          = true
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "192.168.60.165/24"
        gateway = "192.168.60.1"
      }
      ipv6 {
        address = "2600:8801:2aa0:b305:be24:11ff:fe80:d75a/64"
        gateway = "2600:8801:2aa0:b305::1"
      }
    }

    user_account {
      username = "esun-local"
      keys     = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

  network_device {
    bridge      = "vmbr0"
    vlan_id     = 60
    trunks      = "60;1610"
    mac_address = "BC:24:11:80:D7:5A"
    mtu         = 1
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

/* resource "proxmox_virtual_environment_vm" "scrypted_docker" { */
/*   name        = "scrypted.docker.xuhuisun.local" */
/*   description = "scrypted - docker" */
/*   tags        = ["managed-by_terraform", "os_linux", "os-sku_ubuntu", "os-image-version_ubuntu-22-jammy-qcow2", "type_docker"] */

/*   node_name = "pve2" */
/*   vm_id     = 221 */

/*   agent { */
/*     enabled = false */
/*   } */

/*   startup { */
/*     order = "2" */
/*   } */

/*   cpu { */
/*     cores   = 1 */
/*     numa    = true */
/*     sockets = 1 */
/*     type    = "host" */
/*   } */

/*   memory { */
/*     dedicated = 1024 */
/*     floating  = 1024 */
/*   } */

/*   disk { */
/*     datastore_id = "local-zfs" */
/*     file_id      = proxmox_virtual_environment_download_file.ubuntu_24_noble_qcow2_image.id */
/*     interface    = "scsi0" */
/*     iothread     = true */
/*     discard      = "on" */
/*     size         = 10 */
/*     ssd          = true */
/*   } */

/*   initialization { */
/*     datastore_id = "local-zfs" */

/*     ip_config { */
/*       ipv4 { */
/*         address = "192.168.20.221/24" */
/*         gateway = "192.168.20.1" */
/*       } */
/*     } */

/*     user_account { */
/*       username = "esun-local" */
/*       keys     = [trimspace(data.local_file.ssh_public_key.content)] */
/*     } */
/*   } */

/*   network_device { */
/*     bridge  = "vmbr0" */
/*     vlan_id = 20 */
/*     mtu = 1 */
/*   } */

/*   operating_system { */
/*     type = "l26" */
/*   } */

/*   scsi_hardware = "virtio-scsi-single" */

/*   tpm_state { */
/*     datastore_id = "local-zfs" */
/*     version      = "v2.0" */
/*   } */
/* } */

resource "proxmox_virtual_environment_download_file" "ubuntu_24_noble_qcow2_image" {
  content_type = "iso"
  datastore_id = "local"
  node_name    = "pve2"

  url = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"

  overwrite = false
}
