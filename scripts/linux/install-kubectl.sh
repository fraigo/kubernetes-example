#!/bin/bash

# kubectl installing script
# based on https://kubernetes.io/docs/tasks/tools/install-kubectl/

if [ -e /usr/local/bin/kubectl ]; then

    #Get current version of kubectl
    export KUBECTL_VER=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
    #Specific version
    export KUBECTL_VER=v1.9.6
    #Download kubectl
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VER/bin/linux/amd64/kubectl
    #make kubectl executable
    chmod +x ./kubectl
    #Move to a global bin folder
    sudo mv ./kubectl /usr/local/bin/kubectl

fi

