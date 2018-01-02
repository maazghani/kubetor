.PHONY: up use down
V=1
SOCKSIP:=$(shell kubectl get svc kubetor -o jsonpath='{.status.loadBalancer.ingress[].ip}')
VERSION:=$(shell git rev-parse --short HEAD)
up: 
	@sed -i -- 's/GITVERSION/'"${VERSION}"'/g' kubetor.yml
	kubectl apply -f kubetor.yml --record

use:
	@echo "For use with shell environment: \n export SOCKS_IP=${SOCKSIP}" 
	@echo ${SOCKSIP} | pbcopy
	@echo "Copied to clipboard."

down: 
	kubectl delete -f kubetor.yml
	@sed -i -- 's/'"${VERSION}"'/GITVERSION/g' kubetor.yml
