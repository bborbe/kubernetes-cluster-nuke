#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})


mkdir -p ${SCRIPT_ROOT}/../kubernetes-master/ssl
cp ${SCRIPT_ROOT}/ca.pem ${SCRIPT_ROOT}/../kubernetes-master/ssl/ca.pem
cp ${SCRIPT_ROOT}/kubernetes-master.pem ${SCRIPT_ROOT}/../kubernetes-master/ssl/node.pem
cp ${SCRIPT_ROOT}/kubernetes-master-key.pem ${SCRIPT_ROOT}/../kubernetes-master/ssl/node-key.pem
#chmod 600 ${SCRIPT_ROOT}/../kubernetes-master/ssl/*.pem
chown root:root ${SCRIPT_ROOT}/../kubernetes-master/ssl/*.pem

mkdir -p ${SCRIPT_ROOT}/../kubernetes-storage/ssl
cp ${SCRIPT_ROOT}/ca.pem ${SCRIPT_ROOT}/../kubernetes-storage/ssl/ca.pem
cp ${SCRIPT_ROOT}/kubernetes-storage.pem ${SCRIPT_ROOT}/../kubernetes-storage/ssl/node.pem
cp ${SCRIPT_ROOT}/kubernetes-storage-key.pem ${SCRIPT_ROOT}/../kubernetes-storage/ssl/node-key.pem
#chmod 600 ${SCRIPT_ROOT}/../kubernetes-storage/ssl/*.pem
chown root:root ${SCRIPT_ROOT}/../kubernetes-storage/ssl/*.pem

mkdir -p ${SCRIPT_ROOT}/../kubernetes-etcd0/ssl
cp ${SCRIPT_ROOT}/ca.pem ${SCRIPT_ROOT}/../kubernetes-etcd0/ssl/ca.pem
cp ${SCRIPT_ROOT}/kubernetes-etcd0.pem ${SCRIPT_ROOT}/../kubernetes-etcd0/ssl/node.pem
cp ${SCRIPT_ROOT}/kubernetes-etcd0-key.pem ${SCRIPT_ROOT}/../kubernetes-etcd0/ssl/node-key.pem
#chmod 600 ${SCRIPT_ROOT}/../kubernetes-etcd0/ssl/*.pem
chown root:root ${SCRIPT_ROOT}/../kubernetes-etcd0/ssl/*.pem

mkdir -p ${SCRIPT_ROOT}/../kubernetes-etcd1/ssl
cp ${SCRIPT_ROOT}/ca.pem ${SCRIPT_ROOT}/../kubernetes-etcd1/ssl/ca.pem
cp ${SCRIPT_ROOT}/kubernetes-etcd1.pem ${SCRIPT_ROOT}/../kubernetes-etcd1/ssl/node.pem
cp ${SCRIPT_ROOT}/kubernetes-etcd1-key.pem ${SCRIPT_ROOT}/../kubernetes-etcd1/ssl/node-key.pem
#chmod 600 ${SCRIPT_ROOT}/../kubernetes-etcd1/ssl/*.pem
chown root:root ${SCRIPT_ROOT}/../kubernetes-etcd1/ssl/*.pem

mkdir -p ${SCRIPT_ROOT}/../kubernetes-etcd2/ssl
cp ${SCRIPT_ROOT}/ca.pem ${SCRIPT_ROOT}/../kubernetes-etcd2/ssl/ca.pem
cp ${SCRIPT_ROOT}/kubernetes-etcd2.pem ${SCRIPT_ROOT}/../kubernetes-etcd2/ssl/node.pem
cp ${SCRIPT_ROOT}/kubernetes-etcd2-key.pem ${SCRIPT_ROOT}/../kubernetes-etcd2/ssl/node-key.pem
#chmod 600 ${SCRIPT_ROOT}/../kubernetes-etcd2/ssl/*.pem
chown root:root ${SCRIPT_ROOT}/../kubernetes-etcd2/ssl/*.pem

mkdir -p ${SCRIPT_ROOT}/../kubernetes-worker0/ssl
cp ${SCRIPT_ROOT}/ca.pem ${SCRIPT_ROOT}/../kubernetes-worker0/ssl/ca.pem
cp ${SCRIPT_ROOT}/kubernetes-worker0.pem ${SCRIPT_ROOT}/../kubernetes-worker0/ssl/node.pem
cp ${SCRIPT_ROOT}/kubernetes-worker0-key.pem ${SCRIPT_ROOT}/../kubernetes-worker0/ssl/node-key.pem
#chmod 600 ${SCRIPT_ROOT}/../kubernetes-worker0/ssl/*.pem
chown root:root ${SCRIPT_ROOT}/../kubernetes-worker0/ssl/*.pem

mkdir -p ${SCRIPT_ROOT}/../kubernetes-worker1/ssl
cp ${SCRIPT_ROOT}/ca.pem ${SCRIPT_ROOT}/../kubernetes-worker1/ssl/ca.pem
cp ${SCRIPT_ROOT}/kubernetes-worker1.pem ${SCRIPT_ROOT}/../kubernetes-worker1/ssl/node.pem
cp ${SCRIPT_ROOT}/kubernetes-worker1-key.pem ${SCRIPT_ROOT}/../kubernetes-worker1/ssl/node-key.pem
#chmod 600 ${SCRIPT_ROOT}/../kubernetes-worker1/ssl/*.pem
chown root:root ${SCRIPT_ROOT}/../kubernetes-worker1/ssl/*.pem

mkdir -p ${SCRIPT_ROOT}/../kubernetes-worker2/ssl
cp ${SCRIPT_ROOT}/ca.pem ${SCRIPT_ROOT}/../kubernetes-worker2/ssl/ca.pem
cp ${SCRIPT_ROOT}/kubernetes-worker2.pem ${SCRIPT_ROOT}/../kubernetes-worker2/ssl/node.pem
cp ${SCRIPT_ROOT}/kubernetes-worker2-key.pem ${SCRIPT_ROOT}/../kubernetes-worker2/ssl/node-key.pem
#chmod 600 ${SCRIPT_ROOT}/../kubernetes-worker2/ssl/*.pem
chown root:root ${SCRIPT_ROOT}/../kubernetes-worker2/ssl/*.pem

