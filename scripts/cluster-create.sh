#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

echo "downloading image ..."
wget http://stable.release.core-os.net/amd64-usr/current/coreos_production_qemu_image.img.bz2 -O - | bzcat > /var/lib/libvirt/images/coreos_production_qemu_image.img
#wget http://beta.release.core-os.net/amd64-usr/current/coreos_production_qemu_image.img.bz2 -O - | bzcat > /var/lib/libvirt/images/coreos_production_qemu_image.img
#wget http://alpha.release.core-os.net/amd64-usr/current/coreos_production_qemu_image.img.bz2 -O - | bzcat > /var/lib/libvirt/images/coreos_production_qemu_image.img

echo "converting image ..."
qemu-img convert /var/lib/libvirt/images/coreos_production_qemu_image.img -O raw /var/lib/libvirt/images/coreos_production_qemu_image.raw

echo "create lvm volumes ..."

lvcreate -L 10G -n kubernetes-master system
lvcreate -L 10G -n kubernetes-master-docker system
lvcreate -L 10G -n kubernetes-master-kubelet system

lvcreate -L 10G -n kubernetes-storage system
lvcreate -L 10G -n kubernetes-storage-docker system
lvcreate -L 10G -n kubernetes-storage-kubelet system

lvcreate -L 10G -n kubernetes-etcd0 system
lvcreate -L 10G -n kubernetes-etcd0-docker system
lvcreate -L 10G -n kubernetes-etcd0-kubelet system

lvcreate -L 10G -n kubernetes-etcd1 system
lvcreate -L 10G -n kubernetes-etcd1-docker system
lvcreate -L 10G -n kubernetes-etcd1-kubelet system

lvcreate -L 10G -n kubernetes-etcd2 system
lvcreate -L 10G -n kubernetes-etcd2-docker system
lvcreate -L 10G -n kubernetes-etcd2-kubelet system

lvcreate -L 10G -n kubernetes-worker0 system
lvcreate -L 10G -n kubernetes-worker0-docker system
lvcreate -L 10G -n kubernetes-worker0-kubelet system

lvcreate -L 10G -n kubernetes-worker1 system
lvcreate -L 10G -n kubernetes-worker1-docker system
lvcreate -L 10G -n kubernetes-worker1-kubelet system

lvcreate -L 10G -n kubernetes-worker2 system
lvcreate -L 10G -n kubernetes-worker2-docker system
lvcreate -L 10G -n kubernetes-worker2-kubelet system


echo "writing images ..."

dd bs=1M iflag=direct oflag=direct if=/var/lib/libvirt/images/coreos_production_qemu_image.raw of=/dev/system/kubernetes-master

dd bs=1M iflag=direct oflag=direct if=/var/lib/libvirt/images/coreos_production_qemu_image.raw of=/dev/system/kubernetes-storage

dd bs=1M iflag=direct oflag=direct if=/var/lib/libvirt/images/coreos_production_qemu_image.raw of=/dev/system/kubernetes-etcd0

dd bs=1M iflag=direct oflag=direct if=/var/lib/libvirt/images/coreos_production_qemu_image.raw of=/dev/system/kubernetes-etcd1

dd bs=1M iflag=direct oflag=direct if=/var/lib/libvirt/images/coreos_production_qemu_image.raw of=/dev/system/kubernetes-etcd2

dd bs=1M iflag=direct oflag=direct if=/var/lib/libvirt/images/coreos_production_qemu_image.raw of=/dev/system/kubernetes-worker0

dd bs=1M iflag=direct oflag=direct if=/var/lib/libvirt/images/coreos_production_qemu_image.raw of=/dev/system/kubernetes-worker1

dd bs=1M iflag=direct oflag=direct if=/var/lib/libvirt/images/coreos_production_qemu_image.raw of=/dev/system/kubernetes-worker2


echo "cleanup"
rm /var/lib/libvirt/images/coreos_production_qemu_image.img /var/lib/libvirt/images/coreos_production_qemu_image.raw

${SCRIPT_ROOT}/virsh-create.sh

echo "done"
