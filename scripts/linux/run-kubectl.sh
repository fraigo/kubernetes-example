#!/bin/bash

# minikube/kubectl run script
# based on https://github.com/kubernetes/minikube/blob/v0.25.2/README.md

./install-minikube.sh
./install-kubectl.sh

export MINIKUBE_WANTUPDATENOTIFICATION=false
export MINIKUBE_WANTREPORTERRORPROMPT=false
export MINIKUBE_HOME=$HOME
export CHANGE_MINIKUBE_NONE_USER=true

mkdir -p $HOME/.kube || true
touch $HOME/.kube/config

export KUBECONFIG=$HOME/.kube/config
sudo -E minikube start --vm-driver=none

# this for loop waits until kubectl can access the api server that Minikube has created
echo Waiting for MiniKube API...
for i in {1..150}; do # timeout for 5 minutes
  kubectl get po &> /dev/null
  if [ $? -ne 1 ]; then
    break
  fi
  echo -n .
  sleep 2
done
echo MiniKube API Ok!

# kubectl commands are now able to interact with Minikube cluster
