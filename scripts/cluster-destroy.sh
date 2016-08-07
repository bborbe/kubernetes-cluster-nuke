#!/usr/bin/env bash

set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

${SCRIPT_ROOT}/virsh-destroy.sh
${SCRIPT_ROOT}/virsh-undefine.sh

echo "remove lvm volumes ..."

lvremove /dev/system/kubernetes-master
lvremove /dev/system/kubernetes-master-docker
lvremove /dev/system/kubernetes-master-kubelet

lvremove /dev/system/kubernetes-storage
lvremove /dev/system/kubernetes-storage-docker
lvremove /dev/system/kubernetes-storage-kubelet

lvremove /dev/system/kubernetes-etcd0
lvremove /dev/system/kubernetes-etcd0-docker
lvremove /dev/system/kubernetes-etcd0-kubelet

lvremove /dev/system/kubernetes-etcd1
lvremove /dev/system/kubernetes-etcd1-docker
lvremove /dev/system/kubernetes-etcd1-kubelet

lvremove /dev/system/kubernetes-etcd2
lvremove /dev/system/kubernetes-etcd2-docker
lvremove /dev/system/kubernetes-etcd2-kubelet

lvremove /dev/system/kubernetes-worker0
lvremove /dev/system/kubernetes-worker0-docker
lvremove /dev/system/kubernetes-worker0-kubelet

lvremove /dev/system/kubernetes-worker1
lvremove /dev/system/kubernetes-worker1-docker
lvremove /dev/system/kubernetes-worker1-kubelet

lvremove /dev/system/kubernetes-worker2
lvremove /dev/system/kubernetes-worker2-docker
lvremove /dev/system/kubernetes-worker2-kubelet


echo "done"
