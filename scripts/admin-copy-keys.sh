#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

mkdir -p ~/.kube/hm

scp bborbe@fire.hm.benjamin-borbe.de:/var/lib/libvirt/images/kubernetes/scripts/ca.pem ~/.kube/hm/
scp bborbe@fire.hm.benjamin-borbe.de:/var/lib/libvirt/images/kubernetes/scripts/admin.pem ~/.kube/hm/
scp bborbe@fire.hm.benjamin-borbe.de:/var/lib/libvirt/images/kubernetes/scripts/admin-key.pem ~/.kube/hm/
