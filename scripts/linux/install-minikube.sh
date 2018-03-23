#!/bin/bash

# minikube installing script
# based on https://github.com/kubernetes/minikube/releases

if [ -e /usr/local/bin/kubectl ]; then

    #download latest minikube
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.25.2/minikube-linux-amd64
    #make minikube executable
    chmod +x minikube
    #Move to a global bin folder
    sudo mv minikube /usr/local/bin/

fi
