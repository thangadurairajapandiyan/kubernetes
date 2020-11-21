#!/bin/bash

# Installing Helm version 3
export VERIFY_CHECKSUM=false
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# Configuring git username and mail
git config user.email "play-with-kubernetes@gmail.com"
git config user.name "play-with-kubernetes"

# Initializes cluster master node:
kubeadm init --apiserver-advertise-address $(hostname -i) --pod-network-cidr 10.5.0.0/16

# Initialize cluster networking:
kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml

# Untaint master node to deploy pods in master node
# kubectl taint nodes --all node-role.kubernetes.io/master:NoSchedule-
