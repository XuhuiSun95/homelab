# homelab
homelab automation

### Setup New PVE Node
#### Fist time setup
follow the [instruction](https://pve.proxmox.com/wiki/Installation) for pve
installation.

the first time configuration need use default user and password during the
installtion.
```bash
ansible-playbook -i ansible/inventory ansible/pve-node.yml -u root --become --ask-pass
```

after the configuration above, it will disable the root account ssh login as
well as the password ssh login. need to use your newly created admin user with
ssh key.

#### Provision VMs
```bash
cd terraform
terraform apply
```

#### Regular update
```bash
ansible-playbook -i ansible/inventory ansible/pve-node.yml -u esun-local --become
```
```bash
ansible-playbook -i ansible/inventory ansible/pve-vm.yml -u esun-local --become
```

#### Setup k8s
```bash
docker pull quay.io/kubespray/kubespray:v2.22.1
docker run --rm -it --mount type=bind,source="$(pwd)"/ansible/inventory/myculster,dst=/inventory \
  --mount type=bind,source="${HOME}"/.ssh/id_rsa,dst=/root/.ssh/id_rsa \
  quay.io/kubespray/kubespray:v2.22.1 bash

ansible-playbook -i /inventory/inventory.ini --private-key /root/.ssh/id_rsa cluster.yml -u esun-local -b
```
