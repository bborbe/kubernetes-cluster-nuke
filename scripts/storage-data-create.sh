#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace


echo "create lvm nfsd volumes for kubernetes-storage"
lvcreate -L 5G -n kubernetes-storage-data system

echo "format nfsd volume of kubernetes-storage"
wipefs /dev/system/kubernetes-storage-data
mkfs.ext4 -F /dev/system/kubernetes-storage-data



echo "create lvm storage volumes for kubernetes-worker0"
lvcreate -L 5G -n kubernetes-worker0-storage system

echo "format storage volume of kubernetes-worker0"
wipefs /dev/system/kubernetes-worker0-storage
mkfs.xfs -i size=512 /dev/system/kubernetes-worker0-storage

echo "create lvm storage volumes for kubernetes-worker1"
lvcreate -L 5G -n kubernetes-worker1-storage system

echo "format storage volume of kubernetes-worker1"
wipefs /dev/system/kubernetes-worker1-storage
mkfs.xfs -i size=512 /dev/system/kubernetes-worker1-storage

echo "create lvm storage volumes for kubernetes-worker2"
lvcreate -L 5G -n kubernetes-worker2-storage system

echo "format storage volume of kubernetes-worker2"
wipefs /dev/system/kubernetes-worker2-storage
mkfs.xfs -i size=512 /dev/system/kubernetes-worker2-storage

