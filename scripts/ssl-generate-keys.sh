#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

# https://coreos.com/kubernetes/docs/latest/openssl.html

KUBERNETES_SVC=10.103.0.1
MASTER_IP=172.16.20.10
FIREWALL_IP=172.16.60.6
STORAGE_IP=172.16.20.9

# CA Key
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-ca-key.pem 2048
openssl req -x509 -new -nodes -key ${SCRIPT_ROOT}/kubernetes-ca-key.pem -days 10000 -out ${SCRIPT_ROOT}/kubernetes-ca.pem -subj "/CN=kube-ca"

# Master Key
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-apiserver-key.pem 2048
KUBERNETES_SVC=${KUBERNETES_SVC} MASTER_IP=${MASTER_IP} FIREWALL_IP=${FIREWALL_IP} openssl req -new -key ${SCRIPT_ROOT}/kubernetes-apiserver-key.pem -out ${SCRIPT_ROOT}/kubernetes-apiserver.csr -subj "/CN=kube-apiserver" -config ${SCRIPT_ROOT}/master-openssl.cnf
KUBERNETES_SVC=${KUBERNETES_SVC} MASTER_IP=${MASTER_IP} FIREWALL_IP=${FIREWALL_IP} openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-apiserver.csr -CA ${SCRIPT_ROOT}/kubernetes-ca.pem -CAkey ${SCRIPT_ROOT}/kubernetes-ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-apiserver.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/master-openssl.cnf

# Storage Key
STORAGE_FQDN="storage"
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-${STORAGE_FQDN}-key.pem 2048
NODE_IP=${STORAGE_IP} openssl req -new -key ${SCRIPT_ROOT}/kubernetes-${STORAGE_FQDN}-key.pem -out ${SCRIPT_ROOT}/kubernetes-${STORAGE_FQDN}.csr -subj "/CN=${STORAGE_FQDN}" -config ${SCRIPT_ROOT}/node-openssl.cnf
NODE_IP=${STORAGE_IP} openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-${STORAGE_FQDN}.csr -CA ${SCRIPT_ROOT}/kubernetes-ca.pem -CAkey ${SCRIPT_ROOT}/kubernetes-ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-${STORAGE_FQDN}.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/node-openssl.cnf

# Etcd Key
for ((i=0; i < 3; i++)) do
	value=$((15 + $i))
	ETCD_FQDN="etcd${i}"
	ETCD_IP=172.16.20.22
	openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-${ETCD_FQDN}-key.pem 2048
	NODE_IP=${ETCD_IP} openssl req -new -key ${SCRIPT_ROOT}/kubernetes-${ETCD_FQDN}-key.pem -out ${SCRIPT_ROOT}/kubernetes-${ETCD_FQDN}.csr -subj "/CN=${ETCD_FQDN}" -config ${SCRIPT_ROOT}/node-openssl.cnf
	NODE_IP=${ETCD_IP} openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-${ETCD_FQDN}.csr -CA ${SCRIPT_ROOT}/kubernetes-ca.pem -CAkey ${SCRIPT_ROOT}/kubernetes-ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-${ETCD_FQDN}.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/node-openssl.cnf
done

# Worker Key
for ((i=0; i < 3; i++)) do
	value=$((20 + $i))
	WORKER_FQDN="worker${i}"
	NODE_IP=172.16.20.22
	openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-${WORKER_FQDN}-key.pem 2048
	NODE_IP=${NODE_IP} openssl req -new -key ${SCRIPT_ROOT}/kubernetes-${WORKER_FQDN}-key.pem -out ${SCRIPT_ROOT}/kubernetes-${WORKER_FQDN}.csr -subj "/CN=${WORKER_FQDN}" -config ${SCRIPT_ROOT}/node-openssl.cnf
	NODE_IP=${NODE_IP} openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-${WORKER_FQDN}.csr -CA ${SCRIPT_ROOT}/kubernetes-ca.pem -CAkey ${SCRIPT_ROOT}/kubernetes-ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-${WORKER_FQDN}.pem -days 365 -extensions v3_req -extfile ${SCRIPT_ROOT}/node-openssl.cnf
done

# Admin Key
openssl genrsa -out ${SCRIPT_ROOT}/kubernetes-admin-key.pem 2048
openssl req -new -key ${SCRIPT_ROOT}/kubernetes-admin-key.pem -out ${SCRIPT_ROOT}/kubernetes-admin.csr -subj "/CN=kube-admin"
openssl x509 -req -in ${SCRIPT_ROOT}/kubernetes-admin.csr -CA ${SCRIPT_ROOT}/kubernetes-ca.pem -CAkey ${SCRIPT_ROOT}/kubernetes-ca-key.pem -CAcreateserial -out ${SCRIPT_ROOT}/kubernetes-admin.pem -days 365
