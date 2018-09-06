generate:
	k8s-cluster-generate-configs \
	-logtostderr \
	-v=2 \
	-config cluster-config.json
install:
	go install github.com/bborbe/k8s-cluster-generate-configs
download:
	go get -u github.com/bborbe/k8s-cluster-generate-configs
