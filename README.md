# Kubernetes Cluster Configuration

## Update cluster

```
ssh nuke.hm.benjamin-borbe.de
sudo -s
cd /var/lib/libvirt/images/kubernetes
git pull
virsh destroy kubernetes
virsh start kubernetes
```
