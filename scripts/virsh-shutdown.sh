#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace


virsh shutdown kubernetes-master

virsh shutdown kubernetes-storage

virsh shutdown kubernetes-etcd0

virsh shutdown kubernetes-etcd1

virsh shutdown kubernetes-etcd2

virsh shutdown kubernetes-worker0

virsh shutdown kubernetes-worker1

virsh shutdown kubernetes-worker2

