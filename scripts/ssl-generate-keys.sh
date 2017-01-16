#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

# https://coreos.com/kubernetes/docs/latest/openssl.html

# CA Key
openssl genrsa -out ${SCRIPT_ROOT}/ca-key.pem 2048
openssl req -x509 -new -nodes -key ${SCRIPT_ROOT}/ca-key.pem -days 10000 -out ${SCRIPT_ROOT}/ca.pem -subj "/CN=kube-ca"


# kubernetes
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-key.pem 2048
KUBERNETES_SVC=10.103.0.1 NODE_IP=172.16.24.10 openssl req -new -key ${SCRIPT_ROOT}/kubernetes-key.pem -out ${SCRIPT_ROOT}/kubernetes.csr -subj "/CN=kubernetes" -config ${SCRIPT_ROOT}/master-openssl.cnf
KUBERNETES_SVC=10.103.0.1 NODE_IP=172.16.24.10 openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes.csr -CA ${SCRIPT_ROOT}/ca.pem -CAkey ${SCRIPT_ROOT}/ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/master-openssl.cnf




# Admin Key
openssl genrsa -out ${SCRIPT_ROOT}/admin-key.pem 2048
openssl req -new -key ${SCRIPT_ROOT}/admin-key.pem -out ${SCRIPT_ROOT}/admin.csr -subj "/CN=kube-admin"
openssl x509 -req -in ${SCRIPT_ROOT}/admin.csr -CA ${SCRIPT_ROOT}/ca.pem -CAkey ${SCRIPT_ROOT}/ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/admin.pem -days 365

