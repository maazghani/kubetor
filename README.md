## tor, privoxy, k8s

[![DockerHub Push Status](https://travis-ci.org/maazghani/kubetor.svg?branch=master)](https://travis-ci.org/maazghani/kubetor) 


uses: [torproxy](https://github.com/dperson/torproxy)

## usage

### up
```
make up ## to deploy latest master

make use ## to copy LoadBalancer ingress IP to clipboard
```

Configure a SOCKS proxy for either your CLI (`curl --socks5-hostname $SOCKS_IP:443 google.com`) or as host system SOCKS5 proxy.

### down
```
make down
```
