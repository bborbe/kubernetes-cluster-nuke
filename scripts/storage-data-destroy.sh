#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace


echo "remove lvm data volumes for worker kubernetes-storage"
lvremove /dev/system/kubernetes-storage-data



