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

#### Regular update
```bash
ansible-playbook -i ansible/inventory ansible/pve-node.yml -u esun-local --become
```
