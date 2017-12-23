.PHONY: release use

DOCKER_REPO=k8sutils/kubetor
VERSION=$(shell git rev-parse --short HEAD)

release: 
    VERSION=$(git rev-parse --short HEAD)
    sed -i -- 's/GITVERSION/'"${VERSION}"'/g' kubetor.yml
	kubectl apply -f kubetor.yml --record

use:
    export HTTP_PROXY=kubectl get svc kubetor -o jsonpath='{.status.loadBalancer.ingress[].hostname}'
    export HTTPS_PROXY=$HTTP_PROXY
    export http_proxy=$HTTP_PROXY
	export https_proxy=$HTTP_PROXY
