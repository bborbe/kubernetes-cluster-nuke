#!/usr/bin/env bash

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

lvcreate -L 9.5G -n kubernetes system
lvcreate -L 9.5G -n kubernetes-docker system
lvcreate -L 9.5G -n kubernetes-kubelet system


echo "writing images ..."

dd bs=1M iflag=direct oflag=direct if=/var/lib/libvirt/images/coreos_production_qemu_image.raw of=/dev/system/kubernetes


echo "cleanup"
rm /var/lib/libvirt/images/coreos_production_qemu_image.img /var/lib/libvirt/images/coreos_production_qemu_image.raw

${SCRIPT_ROOT}/virsh-create.sh

echo "done"
