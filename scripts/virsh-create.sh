#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace


echo "create virsh kubernetes-master mac=00:16:3e:2f:20:0a ..."
virt-install \
--import \
--debug \
--serial pty \
--accelerate \
--ram 1000 \
--vcpus 2 \
--cpu=host \
--os-type linux \
--os-variant virtio26 \
--noautoconsole \
--nographics \
--name kubernetes-master \
--disk /dev/system/kubernetes-master,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-master-docker,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-master-kubelet,bus=virtio,cache=none,io=native \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-master/config/,config-2,type=mount,mode=squash \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-master/ssl/,kubernetes-ssl,type=mount,mode=squash \
--network bridge=privatebr0,mac=00:16:3e:2f:20:0a,model=virtio

echo "create virsh kubernetes-storage mac=00:16:3e:2f:20:0b ..."
virt-install \
--import \
--debug \
--serial pty \
--accelerate \
--ram 750 \
--vcpus 2 \
--cpu=host \
--os-type linux \
--os-variant virtio26 \
--noautoconsole \
--nographics \
--name kubernetes-storage \
--disk /dev/system/kubernetes-storage,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-storage-docker,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-storage-kubelet,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-storage-data,bus=virtio,cache=none,io=native \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-storage/config/,config-2,type=mount,mode=squash \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-storage/ssl/,kubernetes-ssl,type=mount,mode=squash \
--network bridge=privatebr0,mac=00:16:3e:2f:20:0b,model=virtio

echo "create virsh kubernetes-etcd0 mac=00:16:3e:2f:20:0c ..."
virt-install \
--import \
--debug \
--serial pty \
--accelerate \
--ram 750 \
--vcpus 2 \
--cpu=host \
--os-type linux \
--os-variant virtio26 \
--noautoconsole \
--nographics \
--name kubernetes-etcd0 \
--disk /dev/system/kubernetes-etcd0,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-etcd0-docker,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-etcd0-kubelet,bus=virtio,cache=none,io=native \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-etcd0/config/,config-2,type=mount,mode=squash \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-etcd0/ssl/,kubernetes-ssl,type=mount,mode=squash \
--network bridge=privatebr0,mac=00:16:3e:2f:20:0c,model=virtio

echo "create virsh kubernetes-etcd1 mac=00:16:3e:2f:20:0d ..."
virt-install \
--import \
--debug \
--serial pty \
--accelerate \
--ram 750 \
--vcpus 2 \
--cpu=host \
--os-type linux \
--os-variant virtio26 \
--noautoconsole \
--nographics \
--name kubernetes-etcd1 \
--disk /dev/system/kubernetes-etcd1,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-etcd1-docker,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-etcd1-kubelet,bus=virtio,cache=none,io=native \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-etcd1/config/,config-2,type=mount,mode=squash \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-etcd1/ssl/,kubernetes-ssl,type=mount,mode=squash \
--network bridge=privatebr0,mac=00:16:3e:2f:20:0d,model=virtio

echo "create virsh kubernetes-etcd2 mac=00:16:3e:2f:20:0e ..."
virt-install \
--import \
--debug \
--serial pty \
--accelerate \
--ram 750 \
--vcpus 2 \
--cpu=host \
--os-type linux \
--os-variant virtio26 \
--noautoconsole \
--nographics \
--name kubernetes-etcd2 \
--disk /dev/system/kubernetes-etcd2,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-etcd2-docker,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-etcd2-kubelet,bus=virtio,cache=none,io=native \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-etcd2/config/,config-2,type=mount,mode=squash \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-etcd2/ssl/,kubernetes-ssl,type=mount,mode=squash \
--network bridge=privatebr0,mac=00:16:3e:2f:20:0e,model=virtio

echo "create virsh kubernetes-worker0 mac=00:16:3e:2f:20:0f ..."
virt-install \
--import \
--debug \
--serial pty \
--accelerate \
--ram 3000 \
--vcpus 4 \
--cpu=host \
--os-type linux \
--os-variant virtio26 \
--noautoconsole \
--nographics \
--name kubernetes-worker0 \
--disk /dev/system/kubernetes-worker0,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-worker0-docker,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-worker0-kubelet,bus=virtio,cache=none,io=native \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-worker0/config/,config-2,type=mount,mode=squash \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-worker0/ssl/,kubernetes-ssl,type=mount,mode=squash \
--network bridge=privatebr0,mac=00:16:3e:2f:20:0f,model=virtio

echo "create virsh kubernetes-worker1 mac=00:16:3e:2f:20:10 ..."
virt-install \
--import \
--debug \
--serial pty \
--accelerate \
--ram 3000 \
--vcpus 4 \
--cpu=host \
--os-type linux \
--os-variant virtio26 \
--noautoconsole \
--nographics \
--name kubernetes-worker1 \
--disk /dev/system/kubernetes-worker1,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-worker1-docker,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-worker1-kubelet,bus=virtio,cache=none,io=native \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-worker1/config/,config-2,type=mount,mode=squash \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-worker1/ssl/,kubernetes-ssl,type=mount,mode=squash \
--network bridge=privatebr0,mac=00:16:3e:2f:20:10,model=virtio

echo "create virsh kubernetes-worker2 mac=00:16:3e:2f:20:11 ..."
virt-install \
--import \
--debug \
--serial pty \
--accelerate \
--ram 3000 \
--vcpus 4 \
--cpu=host \
--os-type linux \
--os-variant virtio26 \
--noautoconsole \
--nographics \
--name kubernetes-worker2 \
--disk /dev/system/kubernetes-worker2,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-worker2-docker,bus=virtio,cache=none,io=native \
--disk /dev/system/kubernetes-worker2-kubelet,bus=virtio,cache=none,io=native \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-worker2/config/,config-2,type=mount,mode=squash \
--filesystem /var/lib/libvirt/images/kubernetes/kubernetes-worker2/ssl/,kubernetes-ssl,type=mount,mode=squash \
--network bridge=privatebr0,mac=00:16:3e:2f:20:11,model=virtio

