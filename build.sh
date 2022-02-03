#!/bin/bash

export DOCKER_CONTENT_TRUST=0
echo "Building Docker Image for java-pci"

#docker build --pull --no-cache -t citypay/java-pci:1.8 .
docker build -t citypay/java-pci:1.8 .
docker push citypay/java-pci:1.8
# docker trust sign citypay/java-pci:1.8
