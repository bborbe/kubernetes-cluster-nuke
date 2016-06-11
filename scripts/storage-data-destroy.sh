#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace


echo "remove lvm data volumes for worker kubernetes-storage"
lvremove /dev/system/kubernetes-storage-data



echo "remove lvm data volumes for worker kubernetes-worker0"
lvremove /dev/system/kubernetes-worker0-storage

echo "remove lvm data volumes for worker kubernetes-worker1"
lvremove /dev/system/kubernetes-worker1-storage

echo "remove lvm data volumes for worker kubernetes-worker2"
lvremove /dev/system/kubernetes-worker2-storage

