#!/bin/sh

: ${TYPE:="interopnet"}
: ${AMD:="true"}
: ${ADDRESS:="127.0.0.1"}


# install docker.io
apt update && apt install docker.io -y

# setup registry
docker run -d -p 5000:5000 --name registry registry:2

# pull base images
docker pull mslovy/lotus:intel
docker pull mslovy/lotus:intel_gpu

# building images
if [ x"$TYPE" == x"interopnet" ]; then
    docker build -t ${ADDRESS}:5000/lotus:intel -f interopnet/Dockerfile
    docker build -t ${ADDRESS}:5000/lotus:intel_gpu -f interopnet_gpu/Dockerfile
    if [ x"$AMD" == x"true" ]; then
	sed -i "s#docker.io/mslovy#${ADDRESS}:5000#" AMD/Dockerfile
	sed -i "s#docker.io/mslovy#${ADDRESS}:5000#" AMD_gpu/Dockerfile
        docker build -t ${ADDRESS}:5000/lotus:AMD -f AMD/Dockerfile 
        docker build -t ${ADDRESS}:5000/lotus:AMD_gpu -f AMD_gpu/Dockerfile
	git checkout -f
    fi
else
    if [ x"$AMD" == x"true" ]; then
	docker build -t ${ADDRESS}:5000/lotus:AMD -f AMD/Dockerfile 
	docker build -t ${ADDRESS}:5000/lotus:AMD_gpu -f AMD_gpu/Dockerfile
    fi
fi
