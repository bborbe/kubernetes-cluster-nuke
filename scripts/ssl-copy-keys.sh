#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})


mkdir -p ${SCRIPT_ROOT}/../kubernetes/ssl
cp ${SCRIPT_ROOT}/ca.pem ${SCRIPT_ROOT}/../kubernetes/ssl/ca.pem
cp ${SCRIPT_ROOT}/kubernetes.pem ${SCRIPT_ROOT}/../kubernetes/ssl/node.pem
cp ${SCRIPT_ROOT}/kubernetes-key.pem ${SCRIPT_ROOT}/../kubernetes/ssl/node-key.pem
#chmod 600 ${SCRIPT_ROOT}/../kubernetes/ssl/*.pem
chown root:root ${SCRIPT_ROOT}/../kubernetes/ssl/*.pem

