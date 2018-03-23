#!/bin/bash

# based on script from https://github.com/kubernetes/minikube/blob/v0.25.2/README.md

#creating deployment hello-minikube
kubectl run hello-minikube --image=k8s.gcr.io/echoserver:1.4 --port=8080

#expose deployment port
kubectl expose deployment hello-minikube --type=NodePort

# We have now launched an echoserver pod but we have to wait until the pod is up before curling/accessing it
# via the exposed service.
# To check whether the pod is up and running we can use the following:
kubectl get pod

# First time will be in Creating stage
# NAME                              READY     STATUS              RESTARTS   AGE
# hello-minikube-3383150820-vctvh   1/1       ContainerCreating   0          3s

sleep 5
kubectl get pod

# We can see that the pod is still being created from the ContainerCreating status
# NAME                              READY     STATUS    RESTARTS   AGE
# hello-minikube-3383150820-vctvh   1/1       Running   0          13s

# We can see that the pod is now Running and we will now be able to curl it:
curl $(minikube service hello-minikube --url)

#CLIENT VALUES:
#client_address=192.168.99.1
#command=GET
#real path=/


kubectl delete service hello-minikube
#service "hello-minikube" deleted

kubectl delete deployment hello-minikube
#deployment "hello-minikube" deleted

minikube stop
#Stopping local Kubernetes cluster...
#Machine stopped.