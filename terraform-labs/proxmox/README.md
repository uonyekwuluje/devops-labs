# Terraform Stack Operations
Terraform Commands
```
terraform init
terraform validate
terraform plan 
terraform apply -auto-approve
terraform destroy -auto-approve
terraform state pull
```

## Connect to new node
Check IP Addresses and Connect
```
ssh -i ~/.ssh/id_rsa_terraform admin@192.168.1.214
```

## Proxmox Prepare Images
**Create Ubuntu 18 Image**
```
https://cloud-images.ubuntu.com/
wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img

qm create 9000 --name "ubuntu18-template" --memory 2048 --cores 1 --net0 virtio,bridge=vmbr0 
qm importdisk 9000 /data/prxstrg01/cloud-images/bionic-server-cloudimg-amd64.img vm_storage_01 --format qcow2

qm set 9000 --scsihw virtio-scsi-pci --scsi0 vm_storage_01:9000/vm-9000-disk-0.qcow2
qm set 9000 --boot c --bootdisk scsi0
qm set 9000 --agent 1
qm set 9000 --ide2 vm_storage_01:cloudinit
qm set 9000 --serial0 socket --vga serial0
qm set 9000 --ipconfig0 ip=dhcp
qm resize 9000 scsi0 20G
qm template 9000

qm clone 9000 150 --name test-ubunt18-box
qm set 150 --cipassword 'password1' --ciuser ubuntu
qm set 150 --sshkey /data/prxstrg01/keys/pub_key.pub
qm start 150
```

**Create Debian 11 Image** 
```
https://cloud.debian.org/images/cloud/bullseye/latest/
wget https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2

qm create 9001 --name "debian11-template" --memory 2048 --cores 1 --net0 virtio,bridge=vmbr0 
qm importdisk 9001 /data/prxstrg01/cloud-images/debian-11-generic-amd64.qcow2 vm_storage_01 --format qcow2

qm set 9001 --scsihw virtio-scsi-pci --scsi0 vm_storage_01:9001/vm-9001-disk-0.qcow2
qm set 9001 --boot c --bootdisk scsi0
qm set 9001 --agent 1
qm set 9001 --ide2 vm_storage_01:cloudinit
qm set 9001 --serial0 socket --vga serial0
qm set 9001 --ipconfig0 ip=dhcp
qm resize 9001 scsi0 20G
qm template 9001

qm clone 9001 150 --name test-debian11-box
qm set 150 --cipassword 'password1' --ciuser debian
qm set 150 --sshkey /data/prxstrg01/keys/pub_key.pub
qm start 150
```

**Create CentOS 7 Image**
```
https://cloud.centos.org/centos/7/images/
wget https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2

qm create 9002 --name "centos7-template" --memory 2048 --cores 1 --net0 virtio,bridge=vmbr0 
qm importdisk 9002 /data/prxstrg01/cloud-images/CentOS-7-x86_64-GenericCloud.qcow2 vm_storage_01 --format qcow2

qm set 9002 --scsihw virtio-scsi-pci --scsi0 vm_storage_01:9002/vm-9002-disk-0.qcow2
qm set 9002 --boot c --bootdisk scsi0
qm set 9002 --agent 1
qm set 9002 --ide2 vm_storage_01:cloudinit
qm set 9002 --serial0 socket --vga serial0
qm set 9002 --ipconfig0 ip=dhcp
qm resize 9002 scsi0 20G
qm template 9002

qm clone 9002 150 --name test-centos7-box
qm set 150 --cipassword 'password1' --ciuser centos
qm set 150 --sshkey /data/prxstrg01/keys/pub_key.pub
qm start 150
```


**Create Amalinux 8 Images**
```
https://repo.almalinux.org/almalinux/8/cloud/x86_64/images/
wget https://repo.almalinux.org/almalinux/8/cloud/x86_64/images/AlmaLinux-8-GenericCloud-latest.x86_64.qcow2

qm create 9003 --name "amalinux8-template" --memory 2048 --cores 1 --net0 virtio,bridge=vmbr0 
qm importdisk 9003 /data/prxstrg01/cloud-images/AlmaLinux-8-GenericCloud-latest.x86_64.qcow2 vm_storage_01 --format qcow2

qm set 9003 --scsihw virtio-scsi-pci --scsi0 vm_storage_01:9003/vm-9003-disk-0.qcow2
qm set 9003 --boot c --bootdisk scsi0
qm set 9003 --agent 1
qm set 9003 --ide2 vm_storage_01:cloudinit
qm set 9003 --serial0 socket --vga serial0
qm set 9003 --ipconfig0 ip=dhcp
qm resize 9003 scsi0 20G
qm template 9003

qm clone 9003 151 --name test-amalinux-box
qm set 151 --cipassword 'password1' --ciuser amalinux
qm set 151 --sshkey /data/prxstrg01/keys/pub_key.pub
qm start 151
```
