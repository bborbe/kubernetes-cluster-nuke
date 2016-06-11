generate:
	k8s_generate_configs -loglevel=debug -config cluster-config.json
install:
	go install github.com/bborbe/kubernetes_tools/bin/k8s_generate_configs
download:
	go get -u github.com/bborbe/kubernetes_tools/bin/k8s_generate_configs
