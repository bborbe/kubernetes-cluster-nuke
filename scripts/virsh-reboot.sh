#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace


virsh reboot kubernetes-etcd0

virsh reboot kubernetes-etcd1

virsh reboot kubernetes-etcd2

virsh reboot kubernetes-master

virsh reboot kubernetes-storage

virsh reboot kubernetes-worker0

virsh reboot kubernetes-worker1

virsh reboot kubernetes-worker2

