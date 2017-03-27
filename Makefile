generate:
	k8s_cluster_generate_configs \
	-logtostderr \
	-v=2 \
	-config cluster-config.json
install:
	go install github.com/bborbe/kubernetes_tools/bin/k8s_cluster_generate_configs
download:
	go get -u github.com/bborbe/kubernetes_tools/bin/k8s_cluster_generate_configs
