.PHONY: up use down
V=1

up: 
	VERSION=$(shell git rev-parse --short HEAD)
	sed -i -- 's/GITVERSION/'"${VERSION}"'/g' kubetor.yml
	kubectl apply -f kubetor.yml --record

use:
	@kubectl get svc kubetor -o jsonpath='{.status.loadBalancer.ingress[].ip}' | pbcopy

down: 
	kubectl delete -f kubetor.yml
