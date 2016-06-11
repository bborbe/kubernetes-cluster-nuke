#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace


virsh start kubernetes-etcd0

virsh start kubernetes-etcd1

virsh start kubernetes-etcd2

virsh start kubernetes-master

virsh start kubernetes-storage

virsh start kubernetes-worker0

virsh start kubernetes-worker1

virsh start kubernetes-worker2

