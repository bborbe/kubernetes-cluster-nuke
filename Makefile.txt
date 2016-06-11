generate:
	k8s_generate_configs -loglevel=debug -config hm.json
install:
	go get -u github.com/bborbe/kubernetes_tools/bin/k8s_generate_configs
