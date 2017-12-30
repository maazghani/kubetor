.PHONY: release use

up: 
	VERSION=$(shell git rev-parse --short HEAD)
	sed -i -- 's/GITVERSION/'"${VERSION}"'/g' kubetor.yml
	kubectl apply -f kubetor.yml --record

use: 
    echo "HTTP_PROXY=" >> proxy
	kubectl get svc kubetor -o jsonpath='{.status.loadBalancer.ingress[].ip}' > proxy
	source proxy
	rm proxy

down: 
	kubectl delete -f kubetor.yml
