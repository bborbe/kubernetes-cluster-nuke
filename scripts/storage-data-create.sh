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



