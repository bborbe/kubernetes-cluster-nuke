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


# kubernetes-master
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-master-key.pem 2048
KUBERNETES_SVC=10.103.0.1 NODE_IP=172.16.22.10 openssl req -new -key ${SCRIPT_ROOT}/kubernetes-master-key.pem -out ${SCRIPT_ROOT}/kubernetes-master.csr -subj "/CN=kubernetes-master" -config ${SCRIPT_ROOT}/master-openssl.cnf
KUBERNETES_SVC=10.103.0.1 NODE_IP=172.16.22.10 openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-master.csr -CA ${SCRIPT_ROOT}/ca.pem -CAkey ${SCRIPT_ROOT}/ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-master.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/master-openssl.cnf



# kubernetes-storage
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-storage-key.pem 2048
NODE_IP=172.16.22.11 openssl req -new -key ${SCRIPT_ROOT}/kubernetes-storage-key.pem -out ${SCRIPT_ROOT}/kubernetes-storage.csr -subj "/CN=kubernetes-storage" -config ${SCRIPT_ROOT}/node-openssl.cnf
NODE_IP=172.16.22.11 openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-storage.csr -CA ${SCRIPT_ROOT}/ca.pem -CAkey ${SCRIPT_ROOT}/ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-storage.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/node-openssl.cnf

# kubernetes-etcd0
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-etcd0-key.pem 2048
NODE_IP=172.16.22.12 openssl req -new -key ${SCRIPT_ROOT}/kubernetes-etcd0-key.pem -out ${SCRIPT_ROOT}/kubernetes-etcd0.csr -subj "/CN=kubernetes-etcd0" -config ${SCRIPT_ROOT}/node-openssl.cnf
NODE_IP=172.16.22.12 openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-etcd0.csr -CA ${SCRIPT_ROOT}/ca.pem -CAkey ${SCRIPT_ROOT}/ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-etcd0.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/node-openssl.cnf

# kubernetes-etcd1
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-etcd1-key.pem 2048
NODE_IP=172.16.22.13 openssl req -new -key ${SCRIPT_ROOT}/kubernetes-etcd1-key.pem -out ${SCRIPT_ROOT}/kubernetes-etcd1.csr -subj "/CN=kubernetes-etcd1" -config ${SCRIPT_ROOT}/node-openssl.cnf
NODE_IP=172.16.22.13 openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-etcd1.csr -CA ${SCRIPT_ROOT}/ca.pem -CAkey ${SCRIPT_ROOT}/ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-etcd1.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/node-openssl.cnf

# kubernetes-etcd2
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-etcd2-key.pem 2048
NODE_IP=172.16.22.14 openssl req -new -key ${SCRIPT_ROOT}/kubernetes-etcd2-key.pem -out ${SCRIPT_ROOT}/kubernetes-etcd2.csr -subj "/CN=kubernetes-etcd2" -config ${SCRIPT_ROOT}/node-openssl.cnf
NODE_IP=172.16.22.14 openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-etcd2.csr -CA ${SCRIPT_ROOT}/ca.pem -CAkey ${SCRIPT_ROOT}/ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-etcd2.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/node-openssl.cnf

# kubernetes-worker0
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-worker0-key.pem 2048
NODE_IP=172.16.22.15 openssl req -new -key ${SCRIPT_ROOT}/kubernetes-worker0-key.pem -out ${SCRIPT_ROOT}/kubernetes-worker0.csr -subj "/CN=kubernetes-worker0" -config ${SCRIPT_ROOT}/node-openssl.cnf
NODE_IP=172.16.22.15 openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-worker0.csr -CA ${SCRIPT_ROOT}/ca.pem -CAkey ${SCRIPT_ROOT}/ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-worker0.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/node-openssl.cnf

# kubernetes-worker1
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-worker1-key.pem 2048
NODE_IP=172.16.22.16 openssl req -new -key ${SCRIPT_ROOT}/kubernetes-worker1-key.pem -out ${SCRIPT_ROOT}/kubernetes-worker1.csr -subj "/CN=kubernetes-worker1" -config ${SCRIPT_ROOT}/node-openssl.cnf
NODE_IP=172.16.22.16 openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-worker1.csr -CA ${SCRIPT_ROOT}/ca.pem -CAkey ${SCRIPT_ROOT}/ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-worker1.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/node-openssl.cnf

# kubernetes-worker2
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-worker2-key.pem 2048
NODE_IP=172.16.22.17 openssl req -new -key ${SCRIPT_ROOT}/kubernetes-worker2-key.pem -out ${SCRIPT_ROOT}/kubernetes-worker2.csr -subj "/CN=kubernetes-worker2" -config ${SCRIPT_ROOT}/node-openssl.cnf
NODE_IP=172.16.22.17 openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-worker2.csr -CA ${SCRIPT_ROOT}/ca.pem -CAkey ${SCRIPT_ROOT}/ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-worker2.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/node-openssl.cnf


# Admin Key
openssl genrsa -out ${SCRIPT_ROOT}/admin-key.pem 2048
openssl req -new -key ${SCRIPT_ROOT}/admin-key.pem -out ${SCRIPT_ROOT}/admin.csr -subj "/CN=kube-admin"
openssl x509 -req -in ${SCRIPT_ROOT}/admin.csr -CA ${SCRIPT_ROOT}/ca.pem -CAkey ${SCRIPT_ROOT}/ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/admin.pem -days 365

