#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace


virsh undefine kubernetes-master

virsh undefine kubernetes-storage

virsh undefine kubernetes-etcd0

virsh undefine kubernetes-etcd1

virsh undefine kubernetes-etcd2

virsh undefine kubernetes-worker0

virsh undefine kubernetes-worker1

virsh undefine kubernetes-worker2

