#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

mkdir -p $HOME/.kube/hm
kubectl config set-cluster hm-cluster --server=https://172.16.60.6:443 --certificate-authority=$HOME/.kube/hm/ca.pem
kubectl config set-credentials hm-admin --certificate-authority=$HOME/.kube/hm/ca.pem --client-key=$HOME/.kube/hm/admin-key.pem --client-certificate=$HOME/.kube/hm/admin.pem
kubectl config set-context hm-system --cluster=hm-cluster --user=hm-admin
kubectl config use-context hm-system

echo "test with 'kubectl get nodes'"
