#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace


virsh destroy kubernetes-master

virsh destroy kubernetes-storage

virsh destroy kubernetes-etcd0

virsh destroy kubernetes-etcd1

virsh destroy kubernetes-etcd2

virsh destroy kubernetes-worker0

virsh destroy kubernetes-worker1

virsh destroy kubernetes-worker2

