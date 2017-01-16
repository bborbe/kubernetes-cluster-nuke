#!/usr/bin/env bash

set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

${SCRIPT_ROOT}/virsh-destroy.sh
${SCRIPT_ROOT}/virsh-undefine.sh

echo "remove lvm volumes ..."

lvremove -f /dev/system/kubernetes
lvremove -f /dev/system/kubernetes-docker
lvremove -f /dev/system/kubernetes-kubelet


echo "done"
