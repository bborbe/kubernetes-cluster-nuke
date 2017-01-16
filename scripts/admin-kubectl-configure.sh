#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})

mkdir -p $HOME/.kube/nuke
kubectl config set-cluster nuke-cluster --server=https://172.16.24.10:443 --certificate-authority=$HOME/.kube/nuke/ca.pem
kubectl config set-credentials nuke-admin --certificate-authority=$HOME/.kube/nuke/ca.pem --client-key=$HOME/.kube/nuke/admin-key.pem --client-certificate=$HOME/.kube/nuke/admin.pem
kubectl config set-context nuke-system --cluster=nuke-cluster --user=nuke-admin
kubectl config use-context nuke-system

echo "test with 'kubectl get nodes'"
